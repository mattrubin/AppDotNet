//
//  ADNMention.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNMention.h"


@implementation ADNMention

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"userId": KEY_ID,
            @"username": KEY_NAME,
            @"length": KEY_LEN,
            @"position": KEY_POS,
            }];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: #%@ @%@ (%u @ %u)]", self.class, self.userId, self.username, self.length, self.position];
}

@end
