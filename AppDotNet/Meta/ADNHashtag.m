//
//  ADNHashtag.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNHashtag.h"

#import "NSDictionary+ADN.h"


#define HASHTAG_KEY_NAME        @"name"
#define HASHTAG_KEY_POSITION    @"pos"
#define HASHTAG_KEY_LENGTH      @"len"


@implementation ADNHashtag

- (void)setAttributesFromDictionary:(NSDictionary *)dictionary
{
    self.name     = [dictionary stringForKey:HASHTAG_KEY_NAME];
    self.position = [dictionary integerForKey:HASHTAG_KEY_POSITION];
    self.length   = [dictionary integerForKey:HASHTAG_KEY_LENGTH];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: %@ (%u @ %u)]", self.class, self.name, self.length, self.position];
}

@end
