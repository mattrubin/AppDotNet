//
//  ADNEntities.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNEntities.h"


@implementation ADNEntities

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@:\n   mentions: %@\n   hashtags: %@\n   links: %@\n]", self.class, self.mentions, self.hashtags, self.links];
}


#pragma mark Transformers

+ (NSValueTransformer *)hashtagsTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSArray *externalArray) {
        NSMutableArray *internalArray = [NSMutableArray arrayWithCapacity:externalArray.count];
        for (NSDictionary *externalObject in externalArray) {
            [internalArray addObject:[ADNHashtag instanceFromDictionary:externalObject]];
        }
        return internalArray;
    } reverseBlock:^id(NSArray *internalArray) {
        NSMutableArray *externalArray = [NSMutableArray arrayWithCapacity:internalArray.count];
        for (ADNHashtag *internalObject in internalArray) {
            [externalArray addObject:internalObject.toDictionary];
        }
        return externalArray;
    }];
}

+ (NSValueTransformer *)linksTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSArray *externalArray) {
        NSMutableArray *internalArray = [NSMutableArray arrayWithCapacity:externalArray.count];
        for (NSDictionary *externalObject in externalArray) {
            [internalArray addObject:[ADNLink instanceFromDictionary:externalObject]];
        }
        return internalArray;
    } reverseBlock:^id(NSArray *internalArray) {
        NSMutableArray *externalArray = [NSMutableArray arrayWithCapacity:internalArray.count];
        for (ADNLink *internalObject in internalArray) {
            [externalArray addObject:internalObject.toDictionary];
        }
        return externalArray;
    }];
}

+ (NSValueTransformer *)mentionsTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSArray *externalArray) {
        NSMutableArray *internalArray = [NSMutableArray arrayWithCapacity:externalArray.count];
        for (NSDictionary *externalObject in externalArray) {
            [internalArray addObject:[ADNMention modelWithExternalRepresentation:externalObject]];
        }
        return internalArray;
    } reverseBlock:^id(NSArray *internalArray) {
        NSMutableArray *externalArray = [NSMutableArray arrayWithCapacity:internalArray.count];
        for (ADNMention *internalObject in internalArray) {
            [externalArray addObject:internalObject.externalRepresentation];
        }
        return externalArray;
    }];
}

@end
