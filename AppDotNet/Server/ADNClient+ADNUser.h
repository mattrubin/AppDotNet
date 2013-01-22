//
//  ADNClient+ADNUser.h
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient.h"
#import "ADNUser.h"


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

- (void)getUsers:(NSArray *)usernamesOrIds                 withCompletionHandler:(NSArrayCompletionHandler)handler;
- (void)searchUsersWithQuery:(NSString *)searchString      withCompletionHandler:(NSArrayCompletionHandler)handler;

- (void)getFollowedUsersForUser:(NSString *)usernameOrId   withCompletionHandler:(NSArrayCompletionHandler)handler;
- (void)getFollowersForUser:(NSString *)usernameOrId       withCompletionHandler:(NSArrayCompletionHandler)handler;
- (void)getFollowedUserIdsForUser:(NSString *)usernameOrId withCompletionHandler:(NSArrayCompletionHandler)handler;
- (void)getFollowerIdsForUser:(NSString *)usernameOrId     withCompletionHandler:(NSArrayCompletionHandler)handler;

- (void)getMutedUsersForUser:(NSString *)usernameOrId      withCompletionHandler:(NSArrayCompletionHandler)handler;

- (void)getUsersWhoRepostedPost:(NSString *)postId         withCompletionHandler:(NSArrayCompletionHandler)handler;
- (void)getUsersWhoStarredPost:(NSString *)postId          withCompletionHandler:(NSArrayCompletionHandler)handler;

@end
