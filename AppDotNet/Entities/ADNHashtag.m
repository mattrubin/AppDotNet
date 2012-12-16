//
//  ADNHashtag.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNHashtag.h"

@implementation ADNHashtag

/*
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization
    }
    return self;
}
*/

- (id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [self init];
    if (self) {
        [self updateWithDictionary:dictionary];
    }
    return self;
}

+ (id)hashtagFromDictionary:(NSDictionary*)dictionary
{
    return [[ADNHashtag alloc] initWithDictionary:dictionary];
}

- (void)updateWithDictionary:(NSDictionary*)dictionary
{
    // TODO
}
@end
