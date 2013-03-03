//
//  ADNClient+ADNPost.h
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient.h"
#import "ADNPost.h"


@interface ADNClient (ADNPost)

- (void)postPost:(ADNPost *)post completionHandler:(ADNUserCompletionHandler)handler;
- (void)postPost:(NSString *)postContent inReplyTo:(NSString *)postID completionHandler:(ADNUserCompletionHandler)handler;

- (void)getGlobalStreamWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler;

@end
