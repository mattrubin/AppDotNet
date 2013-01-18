//
//  ADNClient.h
//  AppDotNet
//
//  Created by Me on 1/17/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "AFHTTPClient.h"
#import "ADNHandlers.h"

#import "ADNUser.h"
#import "ADNChannel.h"


@interface ADNClient : AFHTTPClient

+ (instancetype)sharedClient;

@property (nonatomic, copy) NSString *accessToken;

// Users
- (void)getUser:(NSString*)usernameOrID     withCompletionHandler:(ADNUserCompletionHandler)handler;
- (void)getUserWithID:(NSUInteger)userID        completionHandler:(ADNUserCompletionHandler)handler;
- (void)getUserWithUsername:(NSString*)username completionHandler:(ADNUserCompletionHandler)handler;
- (void)getCurrentUserWithCompletionHandler:(ADNUserCompletionHandler)handler;

@end
