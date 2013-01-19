//
//  ADNJSONRequestOperation.m
//  AppDotNet
//
//  Created by Me on 1/19/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNJSONRequestOperation.h"


@implementation ADNJSONRequestOperation

#pragma mark - AFHTTPRequestOperation

- (void)setCompletionBlockWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [super setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        //NSLog(@"ADN: process response envelope for success: %@", [responseObject class]);
        if (success) {
            dispatch_async(self.successCallbackQueue ?: dispatch_get_main_queue(), ^{
                success(operation, responseObject);
            });
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        //NSLog(@"ADN: process meta content for error: %@", error);
        if (failure) {
            dispatch_async(self.failureCallbackQueue ?: dispatch_get_main_queue(), ^{
                failure(operation, error);
            });
        }
    }];
}

@end
