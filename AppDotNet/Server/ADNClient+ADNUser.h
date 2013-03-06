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

- (void)getUser:(NSString*)usernameOrId withParameters:(NSDictionary *)parameters completionHandler:(ADNUserCompletionHandler)handler;
- (void)getUserWithUsername:(NSString*)username parameters:(NSDictionary *)parameters completionHandler:(ADNUserCompletionHandler)handler;
- (void)getCurrentUserWithParameters:(NSDictionary *)parameters completionHandler:(ADNUserCompletionHandler)handler;

- (void)updateUser:(ADNUser *)user withCompletionHandler:(ADNUserCompletionHandler)handler;

- (void)getAvatarImageForUser:(NSString*)usernameOrId withCompletionHandler:(UIImageCompletionHandler)handler;
- (void)getCoverImageForUser:(NSString*)usernameOrId  withCompletionHandler:(UIImageCompletionHandler)handler;
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


@interface ADNClient (ADNUserDeprecated)

- (void)getUser:(NSString*)usernameOrId     withCompletionHandler:(ADNUserCompletionHandler)handler __attribute__((deprecated("Replaced by -getUser:withParameters:completionHandler:")));
- (void)getUserWithId:(NSUInteger)userId        completionHandler:(ADNUserCompletionHandler)handler __attribute__((deprecated("Replaced by -getUser:withParameters:completionHandler:")));
- (void)getUserWithUsername:(NSString*)username completionHandler:(ADNUserCompletionHandler)handler __attribute__((deprecated("Replaced by -getUserWithUsername:parameters:completionHandler:")));
- (void)getCurrentUserWithCompletionHandler:(ADNUserCompletionHandler)handler __attribute__((deprecated("Replaced by -getCurrentUserWithParameters:completionHandler:")));

@end
