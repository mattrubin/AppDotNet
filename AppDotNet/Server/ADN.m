//
//  ADN.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADN.h"

#import "ASIHTTPRequest.h"
#import "ADNHelper.h"


#define API_HOST @"alpha-api.app.net"
#define API_BASE @"/stream/0/"


typedef id (^ADNDataConverter)(id responseContent);


static NSString *_accessToken;
static BOOL _asynchronous = YES;


@interface ADN ()

+ (void)startRequest:(ASIHTTPRequest*)request;

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint;
+ (ASIHTTPRequest*)requestForEndpoint:(NSString *)endpoint withConverter:(ADNDataConverter)converter handler:(GenericCompletionHandler)handler;
+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withTokenHandler:(ADNTokenCompletionHandler)handler;
+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withChannelHandler:(ADNChannelCompletionHandler)handler;
+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withChannelArrayHandler:(NSArrayCompletionHandler)handler;
+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withMessageHandler:(ADNMessageCompletionHandler)handler;
+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withMessageArrayHandler:(NSArrayCompletionHandler)handler;
+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withUserHandler:(ADNUserCompletionHandler)handler;
+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withUserArrayHandler:(NSArrayCompletionHandler)handler;
+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withArrayHandler:(NSArrayCompletionHandler)handler;

@end


@implementation ADN

+ (NSString*)accessToken
{
    return _accessToken;
}

+ (void)setAccessToken:(NSString*)accessToken
{
    _accessToken = accessToken;
}

+ (BOOL)asynchronous
{
    return _asynchronous;
}

+ (void)useAsynchronous:(BOOL)asynchronous
{
    _asynchronous = asynchronous;
}


+ (void)startRequest:(ASIHTTPRequest*)request
{
    if ([self asynchronous]) {
        [request startAsynchronous];
    } else {
        [request startSynchronous];
    }
}

#pragma mark Requests

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint
{
    NSString *urlString = [NSString stringWithFormat:@"https://%@%@%@", API_HOST, API_BASE, endpoint];
    NSURL *url = [NSURL URLWithString:urlString];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    if ([self accessToken]) {
        [request addRequestHeader:@"Authorization" value:[NSString stringWithFormat:@"Bearer %@", [self accessToken]]];
    }
    
    return request;
}

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withTokenHandler:(ADNTokenCompletionHandler)handler
{
    ADNDataConverter converter = ^id(id responseContent) {
        if ([responseContent isKindOfClass:[NSDictionary class]]) {
            return [ADNToken instanceFromDictionary:responseContent];
        } else {
            return nil;
        }
    };
    
    return [self requestForEndpoint:endpoint withConverter:converter handler:handler];
}

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withChannelHandler:(ADNChannelCompletionHandler)handler
{
    ADNDataConverter converter = ^id(id responseContent) {
        if ([responseContent isKindOfClass:[NSDictionary class]]) {
            return [ADNChannel instanceFromDictionary:responseContent];
        } else {
            return nil;
        }
    };
    
    return [self requestForEndpoint:endpoint withConverter:converter handler:handler];
}

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withChannelArrayHandler:(NSArrayCompletionHandler)handler
{
    ADNDataConverter converter = ^id(id responseContent) {
        if ([responseContent isKindOfClass:[NSArray class]]) {
            NSMutableArray *channels = [NSMutableArray arrayWithCapacity:((NSArray*)responseContent).count];
            for (NSDictionary *responseItem in responseContent) {
                [channels addObject:[ADNChannel instanceFromDictionary:responseItem]];
            }
            return channels;
        } else {
            return nil;
        }
    };
    
    return [self requestForEndpoint:endpoint withConverter:converter handler:handler];
}

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withMessageHandler:(ADNMessageCompletionHandler)handler
{
    ADNDataConverter converter = ^id(id responseContent) {
        if ([responseContent isKindOfClass:[NSDictionary class]]) {
            return [ADNMessage instanceFromDictionary:responseContent];
        } else {
            return nil;
        }
    };
    
    return [self requestForEndpoint:endpoint withConverter:converter handler:handler];
}

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withMessageArrayHandler:(NSArrayCompletionHandler)handler
{
    ADNDataConverter converter = ^id(id responseContent) {
        if ([responseContent isKindOfClass:[NSArray class]]) {
            NSMutableArray *messages = [NSMutableArray arrayWithCapacity:((NSArray*)responseContent).count];
            for (id responseItem in responseContent) {
                if ([responseItem isKindOfClass:[NSDictionary class]]) {
                    [messages addObject:[ADNMessage instanceFromDictionary:responseItem]];
                }
            }
            return messages;
        } else {
            return nil;
        }
    };
    
    return [self requestForEndpoint:endpoint withConverter:converter handler:handler];
}

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withUserHandler:(ADNUserCompletionHandler)handler
{
    ADNDataConverter converter = ^id(id responseContent) {
        if ([responseContent isKindOfClass:[NSDictionary class]]) {
            return [ADNUser modelWithExternalRepresentation:responseContent];
        } else {
            return nil;
        }
    };
    
    return [self requestForEndpoint:endpoint withConverter:converter handler:handler];
}

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withUserArrayHandler:(NSArrayCompletionHandler)handler
{
    ADNDataConverter converter = ^id(id responseContent) {
        if ([responseContent isKindOfClass:[NSArray class]]) {
            NSMutableArray *users = [NSMutableArray arrayWithCapacity:((NSArray*)responseContent).count];
            for (NSDictionary *responseItem in responseContent) {
                [users addObject:[ADNUser modelWithExternalRepresentation:responseItem]];
            }
            return users;
        } else {
            return nil;
        }
    };
    
    return [self requestForEndpoint:endpoint withConverter:converter handler:handler];
}


+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withArrayHandler:(NSArrayCompletionHandler)handler
{
    ADNDataConverter converter = ^id(id responseContent) {
        if ([responseContent isKindOfClass:[NSArray class]]) {
            return [responseContent copy];
        } else {
            return nil;
        }
    };
    
    return [self requestForEndpoint:endpoint withConverter:converter handler:handler];
}


+ (ASIHTTPRequest *)requestForEndpoint:(NSString *)endpoint withConverter:(ADNDataConverter)converter handler:(GenericCompletionHandler)handler
{
    __weak ASIHTTPRequest *request = [self requestForEndpoint:endpoint];
    
    [request setCompletionBlock:^{
        NSData *responseData = [request responseData];
        NSDictionary *responseEnvelope;
        id responseContent;
        NSError *error;
        
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData error:&error])) {
            if ((responseContent = [ADNHelper responseContentFromEnvelope:responseEnvelope error:&error])) {
                if (converter) {
                    responseContent = converter(responseContent);
                }
                if (handler) {
                    handler(responseContent, nil);
                }
                return; // success
            }
        }
        if (handler) {
            handler(nil, error); // failure
        }
    }];
    
    [request setFailedBlock:^{
        if (handler) {
            handler(nil, [request error]);
        }
    }];
    
    return request;
}


#pragma mark - Tokens

+ (void)getTokenWithCompletionHandler:(ADNTokenCompletionHandler)handler
{
    NSString *endpoint = @"token";
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withTokenHandler:handler];
    [self startRequest:request];
}


#pragma mark  - Channels
/*
 * Create a Channel
 * POST /stream/0/channels
 * http://developers.app.net/docs/resources/channel/lifecycle/#create-a-channel
 */
+ (void)createChannel:(ADNChannel*)channel withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = @"channels";
    
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"POST";
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    request.postBody = [[ADNHelper JSONDataFromDictionary:channel.toDictionary] mutableCopy];
    
    [self startRequest:request];
}

/*
 * Update a Channel
 * PUT /stream/0/channels/[channel_id]
 * http://developers.app.net/docs/resources/channel/lifecycle/#update-a-channel
 */
+ (void)updateChannel:(ADNChannel*)channel withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i", [channel.channelID intValue]];
    
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"PUT";
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    request.postBody = [[ADNHelper JSONDataFromDictionary:channel.toDictionary] mutableCopy];
    
    [self startRequest:request];
}

/*
 * Retrieve a Channel
 * GET /stream/0/channels/[channel_id]
 * http://developers.app.net/docs/resources/channel/lookup/#retrieve-a-channel
 */
+ (void)getChannelWithID:(NSString*)channelID withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%@", channelID];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    [self startRequest:request];
}

/*
 * Retrieve multiple Channels
 * GET /stream/0/channels
 * http://developers.app.net/docs/resources/channel/lookup/#retrieve-multiple-channels
 */
+ (void)getChannelsWithIDs:(NSArray*)channelIDs withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = [@"channels?ids=" stringByAppendingString:[channelIDs componentsJoinedByString:@","]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelArrayHandler:handler];
    [self startRequest:request];
}


#pragma mark Channel Subscriptions
/*
 * Get current user's subscribed channels
 * GET /stream/0/channels
 * http://developers.app.net/docs/resources/channel/subscriptions/#get-current-users-subscribed-channels
 */
+ (void)getSubscribedChannelsWithCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = @"channels";
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelArrayHandler:handler];
    [self startRequest:request];
}

/*
 * Subscribe to a Channel
 * POST /stream/0/channels/[channel_id]/subscribe
 * http://developers.app.net/docs/resources/channel/subscriptions/#subscribe-to-a-channel
 */
+ (void)subscribeToChannelWithID:(NSString*)channelID         withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%@/subscribe", channelID];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"POST";
    [self startRequest:request];
}

/*
 * Unsubscribe from a Channel
 * DELETE /stream/0/channels/[channel_id]/subscribe
 * http://developers.app.net/docs/resources/channel/subscriptions/#unsubscribe-from-a-channel
 */
+ (void)unsubscribeFromChannelWithID:(NSString*)channelID     withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%@/subscribe", channelID];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"DELETE";
    [self startRequest:request];
}

/*
 * Retrieve users subscribed to a Channel
 * GET /stream/0/channels/[channel_id]/subscribers
 * http://developers.app.net/docs/resources/channel/subscriptions/#retrieve-users-subscribed-to-a-channel
 */
+ (void)getSubscribersForChannelWithID:(NSString*)channelID   withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%@/subscribers", channelID];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withUserArrayHandler:handler];
    [self startRequest:request];
}

/*
 * Retrieve user ids subscribed to a Channel
 * GET /stream/0/channels/[channel_id]/subscribers/ids
 * http://developers.app.net/docs/resources/channel/subscriptions/#retrieve-user-ids-subscribed-to-a-channel
 */
+ (void)getSubscriberIDsForChannelWithID:(NSString*)channelID withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%@/subscribers/ids", channelID];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withArrayHandler:handler];
    [self startRequest:request];
}

/*
 * Retrieve user ids subscribed to multiple Channels
 * GET /stream/0/channels/subscribers/ids
 * http://developers.app.net/docs/resources/channel/subscriptions/#retrieve-user-ids-subscribed-to-a-channel
 */
+ (void)getSubscriberIDsForChannelsWithIDs:(NSArray*)channelIDs withCompletionHandler:(NSDictionaryCompletionHandler)handler
{
    NSString *idList = [channelIDs componentsJoinedByString:@","];
    NSString *endpoint = [@"channels/subscribers/ids?ids=" stringByAppendingString:idList?idList:@""];
    
    ADNDataConverter converter = ^id(id responseContent) {
        NSDictionary *rawDict = responseContent;
        NSMutableDictionary *resultDict = [NSMutableDictionary dictionaryWithCapacity:rawDict.count];
        
        for (NSString *key in rawDict) {
            NSArray *rawArray = [rawDict objectForKey:key];
            NSMutableArray *channelArray = [NSMutableArray arrayWithCapacity:rawArray.count];
            
            for (NSString *rawString in rawArray) {
                [channelArray addObject:rawString];
            }
            
            [resultDict setObject:channelArray forKey:key];
        }
        return resultDict;
    };
    
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withConverter:converter handler:handler];
    [self startRequest:request];
}


#pragma mark - Messages
/*
 * Retrieve the Messages in a Channel
 * GET /stream/0/channels/[channel_id]/messages
 * http://developers.app.net/docs/resources/message/lifecycle/#retrieve-the-messages-in-a-channel
 */
+ (void)getMessagesInChannelWithID:(NSString*)channelID withCompletionHandler:(NSArrayCompletionHandler)handler
{
    //NSString * endpoint = [NSString stringWithFormat:@"channels/%@/messages", channelID];
    NSString * endpoint = [NSString stringWithFormat:@"channels/%@/messages?include_machine=1&include_annotations=1", channelID];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withMessageArrayHandler:handler];
    [self startRequest:request];
}

/*
 * Create a Message
 * POST /stream/0/channels/[channel_id]/messages
 * http://developers.app.net/docs/resources/message/lifecycle/#create-a-message
 */
+ (void)createMessage:(ADNMessage*)message withCompletionHandler:(ADNMessageCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%@/messages?include_annotations=1", message.channelID];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withMessageHandler:handler];
    request.requestMethod = @"POST";
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    request.postBody = [[ADNHelper JSONDataFromDictionary:message.toDictionary] mutableCopy];
    
    [self startRequest:request];
}

/*
 * Retrieve a Message
 * GET /stream/0/channels/[channel_id]/messages/[message_id]
 * http://developers.app.net/docs/resources/message/lookup/#retrieve-a-message
 */
+ (void)getMessageWithID:(NSString*)messageID inChannelWithID:(NSString*)channelID withCompletionHandler:(ADNMessageCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%@/messages/%@", channelID, messageID];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withMessageHandler:handler];
    [self startRequest:request];
}

/*
 * Retrieve multiple Messages
 * GET /stream/0/channels/messages
 * http://developers.app.net/docs/resources/message/lookup/#retrieve-multiple-messages
 */
+ (void)getMessagesWithIDs:(NSArray*)messageIDs withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/messages?ids=%@", [messageIDs componentsJoinedByString:@","]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withMessageArrayHandler:handler];
    [self startRequest:request];
}

/*
 * Delete a Message
 * DELETE /stream/0/channels/[channel_id]/messages/[message_id]
 * http://developers.app.net/docs/resources/message/lifecycle/#delete-a-message
 */
+ (void)deleteMessageWithID:(NSString*)messageID inChannelWithID:(NSString*)channelID withCompletionHandler:(ADNMessageCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%@/messages/%@", channelID, messageID];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withMessageHandler:handler];
    request.requestMethod = @"DELETE";
    [self startRequest:request];
}


#pragma mark - Users

+ (void)getUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"users/%@", usernameOrID];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withUserHandler:handler];
    [self startRequest:request];
}

+ (void)getCurrentUserWithCompletionHandler:(ADNUserCompletionHandler)handler
{
    [self getUser:@"me" withCompletionHandler:handler];
}

+ (void)getUserWithID:(NSUInteger)userID completionHandler:(ADNUserCompletionHandler)handler
{
    [self getUser:[NSString stringWithFormat:@"%u", userID] withCompletionHandler:handler];
}

+ (void)getUserWithUsername:(NSString*)username completionHandler:(ADNUserCompletionHandler)handler
{
    if (![username hasPrefix:@"@"]) {
        username = [@"@" stringByAppendingString:username];
    }
    
    [self getUser:username withCompletionHandler:handler];
}

@end
