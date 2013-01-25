//
//  ADNClient+ADNPost.m
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient+ADNPost.h"


@implementation ADNClient (ADNPost)

/*
 * Retrieve the Global stream
 * GET /stream/0/posts/stream/global
 * http://developers.app.net/docs/resources/post/streams/#retrieve-the-global-stream
 */
- (void)getGlobalStreamWithCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = @"posts/stream/global";
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForArrayofModelsOfClass:[ADNPost class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

@end
