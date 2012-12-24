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


static NSString *_accessToken;
static BOOL _asynchronous = YES;

@interface ADN ()
+ (void)startRequest:(ASIHTTPRequest*)request;
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

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withUserHandler:(ADNUserCompletionHandler)handler
{
    ADNDataConverter converter = ^id(id responseContent) {
        if ([responseContent isKindOfClass:[NSDictionary class]]) {
            return [ADNUser instanceFromDictionary:responseContent];
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
                [users addObject:[ADNUser instanceFromDictionary:responseItem]];
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
+ (void)getChannelWithID:(NSNumber*)channelID withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i", [channelID intValue]];
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
+ (void)subscribeToChannelWithID:(NSNumber*)channelID         withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i/subscribe", [channelID intValue]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"POST";
    [self startRequest:request];
}

/*
 * Unsubscribe from a Channel
 * DELETE /stream/0/channels/[channel_id]/subscribe
 * http://developers.app.net/docs/resources/channel/subscriptions/#unsubscribe-from-a-channel
 */
+ (void)unsubscribeFromChannelWithID:(NSNumber*)channelID     withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i/subscribe", [channelID intValue]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"DELETE";
    [self startRequest:request];
}

/*
 * Retrieve users subscribed to a Channel
 * GET /stream/0/channels/[channel_id]/subscribers
 * http://developers.app.net/docs/resources/channel/subscriptions/#retrieve-users-subscribed-to-a-channel
 */
+ (void)getSubscribersForChannelWithID:(NSNumber*)channelID   withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i/subscribers", [channelID intValue]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withUserArrayHandler:handler];
    [self startRequest:request];
}

/*
 * Retrieve user ids subscribed to a Channel
 * GET /stream/0/channels/[channel_id]/subscribers/ids
 * http://developers.app.net/docs/resources/channel/subscriptions/#retrieve-user-ids-subscribed-to-a-channel
 */
+ (void)getSubscriberIDsForChannelWithID:(NSNumber*)channelID withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i/subscribers/ids", [channelID intValue]];
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
                [channelArray addObject:[NSNumber numberWithInteger:[rawString integerValue]]];
            }
            
            [resultDict setObject:channelArray forKey:[NSNumber numberWithInteger:[key integerValue]]];
        }
        return resultDict;
    };
    
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withConverter:converter handler:handler];
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
