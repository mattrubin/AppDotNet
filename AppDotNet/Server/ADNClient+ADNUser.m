//
//  ADNClient+ADNUser.m
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient+ADNUser.h"


@implementation ADNClient (ADNUser)

/*
 * Retrieve a User
 * GET /stream/0/users/[user_id]
 * http://developers.app.net/docs/resources/user/lookup/#retrieve-a-user
 */
- (void)getUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"users/%@", usernameOrID];
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForModelOfClass:[ADNUser class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
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


/*
 * Update a User
 * PUT /stream/0/users/me
 * http://developers.app.net/docs/resources/user/profile/#update-a-user
 */
- (void)updateUser:(ADNUser *)user withCompletionHandler:(ADNUserCompletionHandler)handler
{
    
}

/*
 * Retrieve a User's avatar image
 * GET /stream/0/users/[user_id]/avatar
 * http://developers.app.net/docs/resources/user/profile/#retrieve-a-users-avatar-image
 */
- (void)getAvatarImageForUser:(NSString*)usernameOrID withCompletionHandler:(UIImageCompletionHandler)handler
{
    NSAssert(usernameOrID, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/avatar", usernameOrID];
    
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
    
}

/*
 * Retrieve a User's cover image
 * GET /stream/0/users/[user_id]/cover
 * http://developers.app.net/docs/resources/user/profile/#retrieve-a-users-cover-image
 */
- (void)getCoverImageForUser:(NSString*)usernameOrID withCompletionHandler:(UIImageCompletionHandler)handler
{
    NSAssert(usernameOrID, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/cover", usernameOrID];
    
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
    
}

/*
 * Follow a User
 * POST /stream/0/users/[user_id]/follow
 * http://developers.app.net/docs/resources/user/following/#follow-a-user
 */
- (void)followUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSAssert(usernameOrID, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/follow", usernameOrID];
    
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
- (void)unfollowUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSAssert(usernameOrID, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/follow", usernameOrID];
    
    [self deletePath:endpoint
          parameters:nil
             success:[self successBlockForModelOfClass:[ADNUser class] withHandler:handler]
             failure:[self failureBlockForHandler:handler]];
}

/*
 * Mute a User
 * POST /stream/0/users/[user_id]/mute
 * http://developers.app.net/docs/resources/user/muting/#mute-a-user
 */
- (void)muteUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSAssert(usernameOrID, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/mute", usernameOrID];
    
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
- (void)unmuteUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSAssert(usernameOrID, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/mute", usernameOrID];
    
    [self deletePath:endpoint
          parameters:nil
             success:[self successBlockForModelOfClass:[ADNUser class] withHandler:handler]
             failure:[self failureBlockForHandler:handler]];
}

@end
