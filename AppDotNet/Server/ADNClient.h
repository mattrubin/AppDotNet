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


@interface ADNClient : AFHTTPClient

+ (instancetype)sharedClient;

@property (nonatomic, copy) NSString *accessToken;

- (void)getUserWithID:(NSUInteger)userID completionHandler:(void (^)(ADNUser *user, NSError *error))handler;

@end
