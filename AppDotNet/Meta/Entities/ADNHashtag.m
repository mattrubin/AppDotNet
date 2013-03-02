//
//  ADNHashtag.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNHashtag.h"


@implementation ADNHashtag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [super.JSONKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"length": ADNFieldLength,
            @"position": ADNFieldPosition,
            }];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: %@ (%u @ %u)]", self.class, self.name, (unsigned)self.length, (unsigned)self.position];
}

@end
