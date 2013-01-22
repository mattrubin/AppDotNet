//
//  ADNClient+ADNUser.h
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient.h"


@interface ADNClient (ADNUser)

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
