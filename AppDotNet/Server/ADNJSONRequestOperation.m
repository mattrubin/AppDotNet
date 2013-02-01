//
//  ADNJSONRequestOperation.m
//  AppDotNet
//
//  Created by Me on 1/19/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNJSONRequestOperation.h"
#import "ADNResponseEnvelope.h"


@implementation ADNJSONRequestOperation

#pragma mark - AFHTTPRequestOperation

- (void)setCompletionBlockWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [super setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        ADNResponseEnvelope *responseEnvelope = [ADNResponseEnvelope modelWithExternalRepresentation:responseObject];
        
        if (success) {
            success(operation, responseEnvelope);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        ADNResponseEnvelope *responseEnvelope = [ADNResponseEnvelope modelWithExternalRepresentation:((AFJSONRequestOperation *)operation).responseJSON];
        
        NSMutableDictionary *newUserInfo = [error.userInfo mutableCopy];
        [newUserInfo setObject:responseEnvelope forKey:ADNResponseEnvelopeKey];
        NSError *newError = [[NSError alloc] initWithDomain:error.domain code:error.code userInfo:newUserInfo];
        
        if (failure) {
            failure(operation, newError);
        }
    }];
}

@end
