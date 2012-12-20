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


@implementation ADN

+ (NSString*)accessToken
{
    return _accessToken;
}

+ (void)setAccessToken:(NSString*)accessToken
{
    _accessToken = accessToken;
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

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withChannelHandler:(ADNChannelCompletionHandler)handler
{
    __weak ASIHTTPRequest *request = [self requestForEndpoint:endpoint];
    
    [request setCompletionBlock:^{
        NSData *responseData = [request responseData];
        
        NSDictionary *responseEnvelope;
        NSDictionary *responseContent;
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData])) {
            if((responseContent = [ADNHelper responseContentFromEnvelope:responseEnvelope])) {
                ADNChannel *channel = [ADNChannel instanceFromDictionary:responseContent];
                
                if (handler) {
                    handler(channel, nil);
                }
                
            } else {
                if (handler) {
                    NSError *error = [NSError errorWithDomain:@"ADN" code:0 userInfo:[NSDictionary dictionaryWithObject:@"ADN Error" forKey:NSLocalizedDescriptionKey]];
                    handler(nil, error);
                }
            }
        } else {
            if (handler) {
                NSError *error = [NSError errorWithDomain:@"JSON" code:0 userInfo:[NSDictionary dictionaryWithObject:@"JSON Error" forKey:NSLocalizedDescriptionKey]];
                handler(nil, error);
            }
        }
        
    }];
    [request setFailedBlock:^{
        if (handler) {
            handler(nil, [request error]);
        }
    }];

    return request;
}

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withChannelArrayHandler:(NSArrayCompletionHandler)handler
{
    __weak ASIHTTPRequest *request = [self requestForEndpoint:endpoint];
    
    [request setCompletionBlock:^{
        NSData *responseData = [request responseData];
        
        NSDictionary *responseEnvelope;
        NSArray *responseContent;
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData])) {
            if((responseContent = [ADNHelper responseContentFromEnvelope:responseEnvelope])) {
                NSMutableArray *channels = [NSMutableArray arrayWithCapacity:responseContent.count];
                for (NSDictionary *responseItem in responseContent) {
                    [channels addObject:[ADNChannel instanceFromDictionary:responseItem]];
                }
                
                if (handler) {
                    handler(channels, nil);
                }
                
            } else {
                if (handler) {
                    NSError *error = [NSError errorWithDomain:@"ADN" code:0 userInfo:[NSDictionary dictionaryWithObject:@"ADN Error" forKey:NSLocalizedDescriptionKey]];
                    handler(nil, error);
                }
            }
        } else {
            if (handler) {
                NSError *error = [NSError errorWithDomain:@"JSON" code:0 userInfo:[NSDictionary dictionaryWithObject:@"JSON Error" forKey:NSLocalizedDescriptionKey]];
                handler(nil, error);
            }
        }
        
    }];
    [request setFailedBlock:^{
        if (handler) {
            handler(nil, [request error]);
        }
    }];
    
    return request;
}

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withUserArrayHandler:(NSArrayCompletionHandler)handler
{
    __weak ASIHTTPRequest *request = [self requestForEndpoint:endpoint];
    
    [request setCompletionBlock:^{
        NSData *responseData = [request responseData];
        
        NSDictionary *responseEnvelope;
        NSArray *responseContent;
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData])) {
            if((responseContent = [ADNHelper responseContentFromEnvelope:responseEnvelope])) {
                NSMutableArray *users = [NSMutableArray arrayWithCapacity:responseContent.count];
                for (NSDictionary *responseItem in responseContent) {
                    [users addObject:[ADNUser instanceFromDictionary:responseItem]];
                }
                
                if (handler) {
                    handler(users, nil);
                }
                
            } else {
                if (handler) {
                    NSError *error = [NSError errorWithDomain:@"ADN" code:0 userInfo:[NSDictionary dictionaryWithObject:@"ADN Error" forKey:NSLocalizedDescriptionKey]];
                    handler(nil, error);
                }
            }
        } else {
            if (handler) {
                NSError *error = [NSError errorWithDomain:@"JSON" code:0 userInfo:[NSDictionary dictionaryWithObject:@"JSON Error" forKey:NSLocalizedDescriptionKey]];
                handler(nil, error);
            }
        }
        
    }];
    [request setFailedBlock:^{
        if (handler) {
            handler(nil, [request error]);
        }
    }];
    
    return request;
}


+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withArrayHandler:(NSArrayCompletionHandler)handler
{
    __weak ASIHTTPRequest *request = [self requestForEndpoint:endpoint];
    
    [request setCompletionBlock:^{
        NSData *responseData = [request responseData];
        
        NSDictionary *responseEnvelope;
        NSArray *responseContent;
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData])) {
            if((responseContent = [ADNHelper responseContentFromEnvelope:responseEnvelope])) {
                NSArray *objects = [responseContent copy];
                
                if (handler) {
                    handler(objects, nil);
                }
                
            } else {
                if (handler) {
                    NSError *error = [NSError errorWithDomain:@"ADN" code:0 userInfo:[NSDictionary dictionaryWithObject:@"ADN Error" forKey:NSLocalizedDescriptionKey]];
                    handler(nil, error);
                }
            }
        } else {
            if (handler) {
                NSError *error = [NSError errorWithDomain:@"JSON" code:0 userInfo:[NSDictionary dictionaryWithObject:@"JSON Error" forKey:NSLocalizedDescriptionKey]];
                handler(nil, error);
            }
        }
        
    }];
    [request setFailedBlock:^{
        if (handler) {
            handler(nil, [request error]);
        }
    }];
    
    return request;
}

#pragma mark Tokens

+ (void)getTokenWithCompletionHandler:(ADNTokenCompletionHandler)handler
{
    NSString *endpoint = @"token";
    
    __weak ASIHTTPRequest *request = [self requestForEndpoint:endpoint];
    
    [request setCompletionBlock:^{
        NSData *responseData = [request responseData];
        
        NSDictionary *responseEnvelope;
        NSDictionary *tokenDictionary;
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData])) {
            if((tokenDictionary = [ADNHelper responseContentFromEnvelope:responseEnvelope])) {
                ADNToken *token = [ADNToken instanceFromDictionary:tokenDictionary];
                
                if (handler) {
                    handler(token, nil);
                }
                
            } else {
                if (handler) {
                    NSError *error = [NSError errorWithDomain:@"ADN" code:0 userInfo:[NSDictionary dictionaryWithObject:@"ADN Error" forKey:NSLocalizedDescriptionKey]];
                    handler(nil, error);
                }
            }
        } else {
            if (handler) {
                NSError *error = [NSError errorWithDomain:@"JSON" code:0 userInfo:[NSDictionary dictionaryWithObject:@"JSON Error" forKey:NSLocalizedDescriptionKey]];
                handler(nil, error);
            }
        }
        
    }];
    [request setFailedBlock:^{
        NSLog(@"Error: %@", [[request error] localizedDescription]);
        NSLog(@"\n%@", [request responseString]);
        NSLog(@"\n%@", [request requestHeaders]);
        
        if (handler) {
            handler(nil, [request error]);
        }
        
    }];
    
    [request startAsynchronous];
}


#pragma mark  - Channels

+ (void)createChannel:(ADNChannel*)channel withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = @"channels/";
    
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"POST";
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
#warning API Implementation Incomplete
    //request.postBody = ...;
    
    [request startAsynchronous];
}

+ (void)updateChannel:(ADNChannel*)channel withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i", [channel.channelID intValue]];
    
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"PUT";
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
#warning API Implementation Incomplete
    //request.postBody = ...];
    
    [request startAsynchronous];
}

+ (void)getChannelWithID:(NSNumber*)channelID withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i", [channelID intValue]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    [request startAsynchronous];
}

+ (void)getChannelsWithIDs:(NSArray*)channelIDs withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = [@"channels?ids=" stringByAppendingString:[channelIDs componentsJoinedByString:@","]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelArrayHandler:handler];
    [request startAsynchronous];
}


#pragma mark Channel Subscriptions

+ (void)getSubscribedChannelsWithCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = @"channels";
    
    __weak ASIHTTPRequest *request = [self requestForEndpoint:endpoint];
    
    [request setCompletionBlock:^{
        NSData *responseData = [request responseData];
        
        NSDictionary *responseEnvelope;
        NSArray *channelArray;
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData])) {
            if((channelArray = (NSArray*)[ADNHelper responseContentFromEnvelope:responseEnvelope])) {
                NSMutableArray *channels = [NSMutableArray arrayWithCapacity:channelArray.count];
                
                for (NSDictionary *channelDict in channelArray) {
                    [channels addObject:[ADNChannel instanceFromDictionary:channelDict]];
                }
                
                if (handler) {
                    handler(channels, nil);
                }
                
            } else {
                if (handler) {
                    NSError *error = [NSError errorWithDomain:@"ADN" code:0 userInfo:[NSDictionary dictionaryWithObject:@"ADN Error" forKey:NSLocalizedDescriptionKey]];
                    handler(nil, error);
                }
            }
        } else {
            if (handler) {
                NSError *error = [NSError errorWithDomain:@"JSON" code:0 userInfo:[NSDictionary dictionaryWithObject:@"JSON Error" forKey:NSLocalizedDescriptionKey]];
                handler(nil, error);
            }
        }
        
    }];
    [request setFailedBlock:^{
        NSLog(@"Error: %@", [[request error] localizedDescription]);
        NSLog(@"\n%@", [request responseString]);
        NSLog(@"\n%@", [request requestHeaders]);
        
        if (handler) {
            handler(nil, [request error]);
        }
        
    }];
    
    [request startAsynchronous];
}

+ (void)subscribeToChannelWithID:(NSNumber*)channelID         withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i/subscribe", [channelID intValue]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"POST";
    [request startAsynchronous];
}

+ (void)unsubscribeFromChannelWithID:(NSNumber*)channelID     withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i/subscribe", [channelID intValue]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"DELETE";
    [request startAsynchronous];
}

+ (void)getSubscribersForChannelWithID:(NSNumber*)channelID   withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i/subscribers", [channelID intValue]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withUserArrayHandler:handler];
    [request startAsynchronous];
}

+ (void)getSubscriberIDsForChannelWithID:(NSNumber*)channelID withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i/subscribers/ids", [channelID intValue]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withArrayHandler:handler];
    [request startAsynchronous];
}



#pragma mark - Users

+ (void)getUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"users/%@", usernameOrID];
    NSString *urlString = [NSString stringWithFormat:@"https://%@%@%@", API_HOST, API_BASE, endpoint];
    NSURL *url = [NSURL URLWithString:urlString];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    __weak ASIHTTPRequest *request_weak = request;
    
    [request setCompletionBlock:^{
        
        // Use when fetching binary data
        NSData *responseData = [request_weak responseData];
        
        NSDictionary *responseEnvelope;
        NSDictionary *userDictionary;
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData])) {
            if((userDictionary = [ADNHelper responseContentFromEnvelope:responseEnvelope])) {
                ADNUser *user = [ADNUser instanceFromDictionary:userDictionary];
                
                if (handler) {
                    handler(user, nil);
                }
            
            } else {
                if (handler) {
                    NSError *error = [NSError errorWithDomain:@"ADN" code:0 userInfo:[NSDictionary dictionaryWithObject:@"ADN Error" forKey:NSLocalizedDescriptionKey]];
                    handler(nil, error);
                }
            }
        } else {
            if (handler) {
                NSError *error = [NSError errorWithDomain:@"JSON" code:0 userInfo:[NSDictionary dictionaryWithObject:@"JSON Error" forKey:NSLocalizedDescriptionKey]];
                handler(nil, error);
            }
        }

    }];
    [request setFailedBlock:^{
        NSLog(@"Error: %@", [[request_weak error] localizedDescription]);
        if (handler) {
            handler(nil, [request_weak error]);
        }

    }];
    
    //[request startAsynchronous];
    [request startSynchronous];
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
