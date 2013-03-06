//
//  ADNJSONRequestOperation.m
//  AppDotNet
//
//  Created by Matt Rubin on 1/19/13.
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
		NSError *error = nil;
        ADNResponseEnvelope *responseEnvelope = (ADNResponseEnvelope *)[ADNJSONAdapter modelOfClass:[ADNResponseEnvelope class] fromJSONDictionary:responseObject error:&error];
		
		// TODO: do something with error
        
        if (success) {
            success(operation, responseEnvelope);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
		NSError *mantleError = nil;
        ADNResponseEnvelope *responseEnvelope = (ADNResponseEnvelope *)[ADNJSONAdapter modelOfClass:[ADNResponseEnvelope class] fromJSONDictionary:((AFJSONRequestOperation *)operation).responseJSON error:&mantleError];
		
		// TODO: do something with mantleError
        
        NSMutableDictionary *newUserInfo = [error.userInfo mutableCopy];
        [newUserInfo setObject:responseEnvelope forKey:ADNResponseEnvelopeKey];
        NSError *newError = [[NSError alloc] initWithDomain:error.domain code:error.code userInfo:newUserInfo];
        
        if (failure) {
            failure(operation, newError);
        }
    }];
}

@end
