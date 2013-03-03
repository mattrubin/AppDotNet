//
//  ADNClient+ADNText.m
//  AppDotNet
//
//  Created by Matt Rubin on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient+ADNText.h"


@implementation ADNClient (ADNText)

/*
 * Process text
 * POST /stream/0/text/process
 * http://developers.app.net/docs/resources/text-processor/#process-text
 */
- (void)processText:(NSString*)text withCompletionHandler:(ADNTextCompletionHandler)handler
{
    NSString *endpoint = @"text/process";
    
    [self postPath:endpoint
        parameters:@{@"text":text}
           success:[self successBlockForModelOfClass:[ADNText class] withHandler:handler]
           failure:[self failureBlockForHandler:handler]];
}

@end
