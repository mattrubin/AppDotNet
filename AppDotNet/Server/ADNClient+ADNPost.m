//
//  ADNClient+ADNPost.m
//  AppDotNet
//
//  Created by Matt Rubin on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient+ADNPost.h"


@implementation ADNClient (ADNPost)

/*
 * Create a new Post, optionally in reply to an existing Post
 * POST /stream/0/posts
 * http://developers.app.net/docs/resources/post/lifecycle/#create-a-post
 */

- (void)postPost:(ADNPost *)post completionHandler:(ADNPostCompletionHandler)handler
{
	NSString *endpoint = @"posts";
	
	[self postPath:endpoint
		parameters:[ADNJSONAdapter JSONDictionaryFromModel:post]
		   success:[self successBlockForModelOfClass:[ADNPost class] withHandler:handler]
		   failure:[self failureBlockForHandler:handler]];
}

- (void)postPost:(NSString *)postContent inReplyTo:(NSString *)postID completionHandler:(ADNPostCompletionHandler)handler
{
	ADNPost *post = [[ADNPost alloc] init];
	post.text = postContent;
	post.replyToId = postID;
	[self postPost:post completionHandler:handler];
}

/*
 * Retrieve the Global stream
 * GET /stream/0/posts/stream/global
 * http://developers.app.net/docs/resources/post/streams/#retrieve-the-global-stream
 */
- (void)getGlobalStreamWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = @"posts/stream/global";
    
    [self getPath:endpoint
       parameters:parameters
          success:[self successBlockForArrayofModelsOfClass:[ADNPost class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

/*
 * Retrieve the 20 most recent Posts from the current User and the Users they follow
 * GET /stream/0/posts/stream
 * http://developers.app.net/docs/resources/post/streams/#retrieve-a-users-personalized-stream
 */
- (void)getPersonalizedStreamWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler
{
    [self getPath:@"posts/stream"
       parameters:parameters
          success:[self successBlockForArrayofModelsOfClass:[ADNPost class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

/*
 * Return the 20 most recent Posts from the current user’s personalized stream and mentions stream merged into one stream.
 * GET /stream/0/posts/stream/unified
 * http://developers.app.net/docs/resources/post/streams/#retrieve-a-users-unified-stream
 */
- (void)getUnifiedStreamWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler
{
    [self getPath:@"posts/stream/unified"
       parameters:parameters
          success:[self successBlockForArrayofModelsOfClass:[ADNPost class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

/*
 * Retrieve posts for a given user
 * GET /stream/0/users/[user_id]/posts
 * http://developers.app.net/docs/resources/post/streams/#retrieve-posts-created-by-a-user
 */
- (void)getPostsForUser:(NSString *)usernameOrId withParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");
    
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/posts", usernameOrId];
    
    [self getPath:endpoint
       parameters:parameters
          success:[self successBlockForArrayofModelsOfClass:[ADNPost class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

- (void)getPostsForCurrentUserWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler
{
    [self getPostsForUser:@"me" withParameters:parameters completionHandler:handler];
}

/*
 * Retrieve posts that have been starred by a given user
 * GET /stream/0/users/[user_id]/stars
 * http://developers.app.net/docs/resources/post/stars/#retrieve-posts-starred-by-a-user
 */
- (void)getPostsStarredByUser:(NSString *)usernameOrId withParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");
    
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/stars", usernameOrId];
    
    [self getPath:endpoint
       parameters:parameters
          success:[self successBlockForArrayofModelsOfClass:[ADNPost class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

- (void)getPostsStarredByCurrentUserWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler
{
    [self getPostsStarredByUser:@"me" withParameters:parameters completionHandler:handler];
}

/*
 * Retrieve posts that mention a given user
 * GET /stream/0/users/[user_id]/mentions
 * http://developers.app.net/docs/resources/post/streams/#retrieve-posts-mentioning-a-user
 */
- (void)getPostsMentioningUser:(NSString *)usernameOrId withParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler
{
    NSAssert(usernameOrId, @"You must specify a username or ID.");
    
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/mentions", usernameOrId];
    
    [self getPath:endpoint
       parameters:parameters
          success:[self successBlockForArrayofModelsOfClass:[ADNPost class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

- (void)getPostsMentioningCurrentUserWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler
{
    [self getPostsMentioningUser:@"me" withParameters:parameters completionHandler:handler];
}

@end
