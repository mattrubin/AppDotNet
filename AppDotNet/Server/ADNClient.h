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


#pragma mark Users

- (void)getUser:(NSString*)usernameOrID     withCompletionHandler:(ADNUserCompletionHandler)handler;
- (void)getUserWithID:(NSUInteger)userID        completionHandler:(ADNUserCompletionHandler)handler;
- (void)getUserWithUsername:(NSString*)username completionHandler:(ADNUserCompletionHandler)handler;
- (void)getCurrentUserWithCompletionHandler:(ADNUserCompletionHandler)handler;

- (void)updateUser:(ADNUser *)user withCompletionHandler:(ADNUserCompletionHandler)handler;

- (void)getAvatarImageForUser:(NSString*)usernameOrID withCompletionHandler:(UIImageCompletionHandler)handler;
- (void)getCoverImageForUser:(NSString*)usernameOrID  withCompletionHandler:(UIImageCompletionHandler)handler;
- (void)updateAvatarImage:(id)image                   withCompletionHandler:(GenericCompletionHandler)handler;
- (void)updateCoverImage:(id)image                   withCompletionHandler:(GenericCompletionHandler)handler;

- (void)  followUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler;
- (void)unfollowUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler;

- (void)  muteUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler;
- (void)unmuteUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler;

@end
