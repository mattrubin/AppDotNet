//
//  ADNClient+ADNToken.m
//  AppDotNet
//
//  Created by Matt Rubin on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient+ADNToken.h"


@implementation ADNClient (ADNToken)

/*
 * Retrieve current token
 * GET /stream/0/token
 * http://developers.app.net/docs/resources/token/#retrieve-current-token
 */
- (void)getTokenWithParameters:(NSDictionary *)parameters completionHandler:(ADNTokenCompletionHandler)handler
{
    NSString *endpoint = @"token";
    
    [self getPath:endpoint
       parameters:parameters
          success:[self successBlockForModelOfClass:[ADNToken class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

@end
