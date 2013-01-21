//
//  ADNLink.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNLink.h"


@implementation ADNLink

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"length": KEY_LEN,
            @"position": KEY_POS,
            }];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: %@ (%u @ %u) <%@>]", self.class, self.text, self.length, self.position, self.url];
}

@end
