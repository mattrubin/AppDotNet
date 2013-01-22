//
//  ADNClient+ADNUser.m
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient+ADNUser.h"


@implementation ADNClient (ADNUser)

#pragma mark Lookup

/*
 * Retrieve a User
 * GET /stream/0/users/[user_id]
 * http://developers.app.net/docs/resources/user/lookup/#retrieve-a-user
 */
- (void)getUser:(NSString*)usernameOrId withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"users/%@", usernameOrId];
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForModelOfClass:[ADNUser class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

- (void)getCurrentUserWithCompletionHandler:(ADNUserCompletionHandler)handler
{
    [self getUser:@"me" withCompletionHandler:handler];
}

- (void)getUserWithId:(NSUInteger)userId completionHandler:(ADNUserCompletionHandler)handler
{
    [self getUser:[NSString stringWithFormat:@"%u", userId] withCompletionHandler:handler];
}

- (void)getUserWithUsername:(NSString*)username completionHandler:(ADNUserCompletionHandler)handler
{
    if (![username hasPrefix:@"@"]) {
        username = [@"@" stringByAppendingString:username];
    }
    
    [self getUser:username withCompletionHandler:handler];
}

/*
 * Retrieve multiple Users
 * GET /stream/0/users
 * http://developers.app.net/docs/resources/user/lookup/#retrieve-multiple-users
 */
- (void)getUsers:(NSArray *)usernamesOrIds withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSAssert(usernamesOrIds, @"You must specify an array of @usernames and/or IDs.");
    NSParameterAssert([usernamesOrIds isKindOfClass:[NSArray class]]);
    
    NSString *endpoint = [NSString stringWithFormat:@"users?ids=%@", [usernamesOrIds componentsJoinedByString:@","]];
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForArrayofModelsOfClass:[ADNUser class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

/*
 * Search for Users
 * GET /stream/0/users/search
 * http://developers.app.net/docs/resources/user/lookup/#search-for-users
 */
- (void)searchUsersWithQuery:(NSString *)searchString withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSAssert(searchString, @"You must specify a search string.");
    
    NSString *endpoint = [@"users/search?q=" stringByAppendingString:searchString];
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForArrayofModelsOfClass:[ADNUser class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}



#pragma mark Profile

/*
 * Update a User
 * PUT /stream/0/users/me
 * http://developers.app.net/docs/resources/user/profile/#update-a-user
 */
- (void)updateUser:(ADNUser *)user withCompletionHandler:(ADNUserCompletionHandler)handler
{
#warning API call not implemented
}

/*
 * Retrieve a User's avatar image
 * GET /stream/0/users/[user_id]/avatar
 * http://developers.app.net/docs/resources/user/profile/#retrieve-a-users-avatar-image
 */
- (void)getAvatarImageForUser:(NSString*)usernameOrId withCompletionHandler:(UIImageCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/avatar", usernameOrId];
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

/*
 * Update a User's avatar image
 * POST /stream/0/users/me/avatar
 * http://developers.app.net/docs/resources/user/profile/#update-a-users-avatar-image
 */
- (void)updateAvatarImage:(id)image withCompletionHandler:(GenericCompletionHandler)handler
{
#warning API call not implemented
}

/*
 * Retrieve a User's cover image
 * GET /stream/0/users/[user_id]/cover
 * http://developers.app.net/docs/resources/user/profile/#retrieve-a-users-cover-image
 */
- (void)getCoverImageForUser:(NSString*)usernameOrId withCompletionHandler:(UIImageCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/cover", usernameOrId];
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

/*
 * Update a User's cover image
 * POST /stream/0/users/me/cover
 * http://developers.app.net/docs/resources/user/profile/#update-a-users-cover-image
 */
- (void)updateCoverImage:(id)image withCompletionHandler:(GenericCompletionHandler)handler
{
#warning API call not implemented
}



#pragma mark Following

/*
 * Follow a User
 * POST /stream/0/users/[user_id]/follow
 * http://developers.app.net/docs/resources/user/following/#follow-a-user
 */
- (void)followUser:(NSString*)usernameOrId withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/follow", usernameOrId];
    
    [self postPath:endpoint
        parameters:nil
           success:[self successBlockForModelOfClass:[ADNUser class] withHandler:handler]
           failure:[self failureBlockForHandler:handler]];
}

/*
 * Unfollow a User
 * DELETE /stream/0/users/[user_id]/follow
 * http://developers.app.net/docs/resources/user/following/#unfollow-a-user
 */
- (void)unfollowUser:(NSString*)usernameOrId withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/follow", usernameOrId];
    
    [self deletePath:endpoint
          parameters:nil
             success:[self successBlockForModelOfClass:[ADNUser class] withHandler:handler]
             failure:[self failureBlockForHandler:handler]];
}

/*
 * Retrieve Users a User is following
 * GET /stream/0/users/[user_id]/following
 * http://developers.app.net/docs/resources/user/following/#list-users-a-user-is-following
 */
- (void)getFollowedUsersForUser:(NSString *)usernameOrId withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");

    NSString *endpoint = [NSString stringWithFormat:@"users/%@/following", usernameOrId];
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForArrayofModelsOfClass:[ADNUser class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

/*
 * Retrieve Users following a User
 * GET /stream/0/users/[user_id]/followers
 * http://developers.app.net/docs/resources/user/following/#list-users-following-a-user
 */
- (void)getFollowersForUser:(NSString *)usernameOrId withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");
    
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/followers", usernameOrId];
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForArrayofModelsOfClass:[ADNUser class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

/*
 * Retrieve IDs of Users a User is following
 * GET /stream/0/users/[user_id]/following/ids
 * http://developers.app.net/docs/resources/user/following/#list-user-ids-a-user-is-following
 */
- (void)getFollowedUserIdsForUser:(NSString *)usernameOrId withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");
    
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/following/ids", usernameOrId];
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

/*
 * Retrieve IDs of Users following a User
 * GET /stream/0/users/[user_id]/followers/ids
 * http://developers.app.net/docs/resources/user/following/#list-user-ids-following-a-user
 */
- (void)getFollowerIdsForUser:(NSString *)usernameOrId withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");
    
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/followers/ids", usernameOrId];
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}



#pragma mark Muting

/*
 * Mute a User
 * POST /stream/0/users/[user_id]/mute
 * http://developers.app.net/docs/resources/user/muting/#mute-a-user
 */
- (void)muteUser:(NSString*)usernameOrId withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/mute", usernameOrId];
    
    [self postPath:endpoint
        parameters:nil
           success:[self successBlockForModelOfClass:[ADNUser class] withHandler:handler]
           failure:[self failureBlockForHandler:handler]];
}

/*
 * Unmute a User
 * DELETE /stream/0/users/[user_id]/mute
 * http://developers.app.net/docs/resources/user/muting/#unmute-a-user
 */
- (void)unmuteUser:(NSString*)usernameOrId withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/mute", usernameOrId];
    
    [self deletePath:endpoint
          parameters:nil
             success:[self successBlockForModelOfClass:[ADNUser class] withHandler:handler]
             failure:[self failureBlockForHandler:handler]];
}

/*
 * Retrieve muted Users
 * GET /stream/0/users/[user_id]/muted
 * http://developers.app.net/docs/resources/user/muting/#list-muted-users
 */
- (void)getMutedUsersForUser:(NSString *)usernameOrId withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");
    
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/muted", usernameOrId];
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForArrayofModelsOfClass:[ADNUser class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}



#pragma mark Post Interactions

/*
 * Retrieve Users who reposted a Post
 * GET /stream/0/posts/[post_id]/reposters
 * http://developers.app.net/docs/resources/user/post-interactions/#list-users-who-have-reposted-a-post
 */
- (void)getUsersWhoRepostedPost:(NSString *)postId withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSAssert(postId, @"You must specify a post ID.");
    
    NSString *endpoint = [NSString stringWithFormat:@"posts/%@/reposters", postId];
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForArrayofModelsOfClass:[ADNUser class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

/*
 * Retrieve Users who starred a Post
 * GET /stream/0/posts/[post_id]/stars
 * http://developers.app.net/docs/resources/user/post-interactions/#list-users-who-have-starred-a-post
 */
- (void)getUsersWhoStarredPost:(NSString *)postId withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSAssert(postId, @"You must specify a post ID.");
    
    NSString *endpoint = [NSString stringWithFormat:@"posts/%@/stars", postId];
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForArrayofModelsOfClass:[ADNUser class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

@end
