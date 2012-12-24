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

+ (ASIHTTPRequest*)requestForEndpoint:(NSString*)endpoint withChannelHandler:(ADNChannelCompletionHandler)handler
{
    __weak ASIHTTPRequest *request = [self requestForEndpoint:endpoint];
    
    [request setCompletionBlock:^{
        NSData *responseData = [request responseData];
        
        NSDictionary *responseEnvelope;
        NSDictionary *responseContent;
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData error:nil])) {
            if((responseContent = [ADNHelper responseContentFromEnvelope:responseEnvelope error:nil])) {
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
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData error:nil])) {
            if((responseContent = [ADNHelper responseContentFromEnvelope:responseEnvelope error:nil])) {
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
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData error:nil])) {
            if((responseContent = [ADNHelper responseContentFromEnvelope:responseEnvelope error:nil])) {
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
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData error:nil])) {
            if((responseContent = [ADNHelper responseContentFromEnvelope:responseEnvelope error:nil])) {
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
    
    __weak ASIHTTPRequest *request = [self requestForEndpoint:endpoint];
    
    [request setCompletionBlock:^{
        NSData *responseData = [request responseData];
        
        NSDictionary *responseEnvelope;
        NSDictionary *tokenDictionary;
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData error:nil])) {
            if((tokenDictionary = [ADNHelper responseContentFromEnvelope:responseEnvelope error:nil])) {
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
    
    [self startRequest:request];
}


#pragma mark  - Channels

+ (void)createChannel:(ADNChannel*)channel withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = @"channels/";
    
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"POST";
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    request.postBody = [[ADNHelper JSONDataFromDictionary:channel.toDictionary] mutableCopy];
    
    [self startRequest:request];
}

+ (void)updateChannel:(ADNChannel*)channel withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i", [channel.channelID intValue]];
    
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"PUT";
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    request.postBody = [[ADNHelper JSONDataFromDictionary:channel.toDictionary] mutableCopy];
    
    [self startRequest:request];
}

+ (void)getChannelWithID:(NSNumber*)channelID withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i", [channelID intValue]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    [self startRequest:request];
}

+ (void)getChannelsWithIDs:(NSArray*)channelIDs withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = [@"channels?ids=" stringByAppendingString:[channelIDs componentsJoinedByString:@","]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelArrayHandler:handler];
    [self startRequest:request];
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
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData error:nil])) {
            if((channelArray = (NSArray*)[ADNHelper responseContentFromEnvelope:responseEnvelope error:nil])) {
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
    
    [self startRequest:request];
}

+ (void)subscribeToChannelWithID:(NSNumber*)channelID         withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i/subscribe", [channelID intValue]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"POST";
    [self startRequest:request];
}

+ (void)unsubscribeFromChannelWithID:(NSNumber*)channelID     withCompletionHandler:(ADNChannelCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i/subscribe", [channelID intValue]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withChannelHandler:handler];
    request.requestMethod = @"DELETE";
    [self startRequest:request];
}

+ (void)getSubscribersForChannelWithID:(NSNumber*)channelID   withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i/subscribers", [channelID intValue]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withUserArrayHandler:handler];
    [self startRequest:request];
}

+ (void)getSubscriberIDsForChannelWithID:(NSNumber*)channelID withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"channels/%i/subscribers/ids", [channelID intValue]];
    ASIHTTPRequest *request = [self requestForEndpoint:endpoint withArrayHandler:handler];
    [self startRequest:request];
}

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
    NSString *urlString = [NSString stringWithFormat:@"https://%@%@%@", API_HOST, API_BASE, endpoint];
    NSURL *url = [NSURL URLWithString:urlString];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    __weak ASIHTTPRequest *request_weak = request;
    
    [request setCompletionBlock:^{
        
        // Use when fetching binary data
        NSData *responseData = [request_weak responseData];
        
        NSDictionary *responseEnvelope;
        NSDictionary *userDictionary;
        if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:responseData error:nil])) {
            if((userDictionary = [ADNHelper responseContentFromEnvelope:responseEnvelope error:nil])) {
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
