//
//  ADNClient.m
//  AppDotNet
//
//  Created by Me on 1/17/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient.h"
#import "AFJSONRequestOperation.h"

@implementation ADNClient

+ (instancetype)sharedClient
{
    static ADNClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ADNClient alloc] initWithBaseURL:[NSURL URLWithString:@"https://alpha-api.app.net/stream/0/"]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (void)setAccessToken:(NSString *)accessToken
{
    _accessToken = [accessToken copy];
    
    if (_accessToken) {
        [self setDefaultHeader:@"Authorization"
                         value:[@"Bearer " stringByAppendingString:_accessToken]];
    } else {
        [self setDefaultHeader:@"Authorization"
                         value:nil];
    }
}


#pragma mark - Users

- (void)getUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"users/%@", usernameOrID];
    [self getPath:endpoint parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON) {
        ADNUser *user = nil;
        NSDictionary *userFromResponse = [JSON valueForKeyPath:@"data"];
        
        if ([userFromResponse isKindOfClass:[NSDictionary class]]) {
            user = [ADNUser instanceFromDictionary:userFromResponse];
        }
        
        if (handler) {
            handler(user, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (handler) {
            handler(nil, error);
        }
    }];
}

- (void)getCurrentUserWithCompletionHandler:(ADNUserCompletionHandler)handler
{
    [self getUser:@"me" withCompletionHandler:handler];
}

- (void)getUserWithID:(NSUInteger)userID completionHandler:(ADNUserCompletionHandler)handler
{
    [self getUser:[NSString stringWithFormat:@"%u", userID] withCompletionHandler:handler];
}

- (void)getUserWithUsername:(NSString*)username completionHandler:(ADNUserCompletionHandler)handler
{
    if (![username hasPrefix:@"@"]) {
        username = [@"@" stringByAppendingString:username];
    }
    
    [self getUser:username withCompletionHandler:handler];
}


@end
