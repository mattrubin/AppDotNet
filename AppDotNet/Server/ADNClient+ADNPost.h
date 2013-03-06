//
//  ADNClient+ADNPost.h
//  AppDotNet
//
//  Created by Matt Rubin on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient.h"
#import "ADNPost.h"


@interface ADNClient (ADNPost)

- (void)postPost:(ADNPost *)post completionHandler:(ADNPostCompletionHandler)handler;
- (void)postPost:(NSString *)postContent inReplyTo:(NSString *)postID completionHandler:(ADNPostCompletionHandler)handler;

- (void)getGlobalStreamWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler;
- (void)getPersonalizedStreamWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler;
- (void)getUnifiedStreamWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler;

- (void)getPostsForUser:(NSString *)usernameOrId withParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler;
- (void)getPostsForCurrentUserWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler;

- (void)getPostsStarredByUser:(NSString *)usernameOrId withParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler;
- (void)getPostsStarredByCurrentUserWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler;

- (void)getPostsMentioningUser:(NSString *)usernameOrId withParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler;
- (void)getPostsMentioningCurrentUserWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler;

@end
