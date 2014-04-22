//
//  ADNClient+ADNUser.h
//  AppDotNet
//
//  Created by Matt Rubin on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient.h"
#import "ADNUser.h"


@interface ADNClient (ADNUser)

- (void)getUser:(NSString*)usernameOrId     withCompletionHandler:(ADNUserCompletionHandler)handler;
- (void)getUserWithId:(NSUInteger)userId        completionHandler:(ADNUserCompletionHandler)handler;
- (void)getUserWithUsername:(NSString*)username completionHandler:(ADNUserCompletionHandler)handler;
- (void)getCurrentUserWithCompletionHandler:(ADNUserCompletionHandler)handler;

- (void)updateUser:(ADNUser *)user withCompletionHandler:(ADNUserCompletionHandler)handler;

#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
- (void)getAvatarImageForUser:(NSString*)usernameOrId withCompletionHandler:(UIImageCompletionHandler)handler;
- (void)getCoverImageForUser:(NSString*)usernameOrId  withCompletionHandler:(UIImageCompletionHandler)handler;
#else
- (void)getAvatarImageForUser:(NSString*)usernameOrId withCompletionHandler:(NSImageCompletionHandler)handler;
- (void)getCoverImageForUser:(NSString*)usernameOrId  withCompletionHandler:(NSImageCompletionHandler)handler;
#endif
- (void)updateAvatarImage:(id)image                   withCompletionHandler:(GenericCompletionHandler)handler;
- (void)updateCoverImage:(id)image                   withCompletionHandler:(GenericCompletionHandler)handler;

- (void)  followUser:(NSString*)usernameOrId withCompletionHandler:(ADNUserCompletionHandler)handler;
- (void)unfollowUser:(NSString*)usernameOrId withCompletionHandler:(ADNUserCompletionHandler)handler;

- (void)  muteUser:(NSString*)usernameOrId withCompletionHandler:(ADNUserCompletionHandler)handler;
- (void)unmuteUser:(NSString*)usernameOrId withCompletionHandler:(ADNUserCompletionHandler)handler;

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
