//
//  ADNToken.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNToken.h"


@implementation ADNToken

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"clientId": ADNFieldClientId,
            @"storageAvailable": ADNFieldStorageAvailable,
            @"storageUsed": ADNFieldStorageUsed
            }];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: client: %@, scopes: %@, user: %@]", self.class, self.app, self.scopes, self.user];
}

@end
