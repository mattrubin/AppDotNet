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

@end
