//
//  ADNAccessControlList.m
//  AppDotNet
//
//  Created by Matt Rubin on 12/18/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNAccessControlList.h"


@implementation ADNAccessControlList

- (id)init
{
    self = [super init];
    if (self) {
        self.userIds = [NSMutableArray new];
    }
    return self;
}


+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"anyUser": ADNFieldAnyUser,
            @"userIds": ADNFieldUserIds,
            }];
}

+ (NSValueTransformer *)userIdsTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSArray *userIds) {
        return [userIds mutableCopy];
    } reverseBlock:^id(NSMutableArray *userIds) {
        return [userIds copy];
    }];
}

@end
