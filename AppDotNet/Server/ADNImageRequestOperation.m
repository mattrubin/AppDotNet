//
//  ADNImageRequestOperation.m
//  AppDotNet
//
//  Created by Me on 1/18/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNImageRequestOperation.h"


@implementation ADNImageRequestOperation

+(BOOL)canProcessRequest:(NSURLRequest *)urlRequest
{
    static NSSet * _acceptableEndpoints = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _acceptableEndpoints = [[NSSet alloc] initWithObjects:@"avatar", @"cover", nil];
    });
#warning Exclude non-GET requests?
    return [_acceptableEndpoints containsObject:[[urlRequest URL] lastPathComponent]] || [super canProcessRequest:urlRequest];
}

@end
