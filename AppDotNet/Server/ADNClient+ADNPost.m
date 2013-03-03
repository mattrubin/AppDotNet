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
		parameters:[MTLJSONAdapter JSONDictionaryFromModel:post]
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

@end
