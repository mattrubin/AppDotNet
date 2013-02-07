//
//  ADNUser.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNUser.h"


@implementation ADNUser

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"avatarImage": ADNFieldAvatarImage,
            @"canonicalURL": ADNFieldCanonicalURL,
            @"coverImage": ADNFieldCoverImage,
            @"createdAt": ADNFieldCreatedAt,
            @"userId": ADNFieldId,
            @"followsYou": ADNFieldFollowsYou,
            @"youFollow": ADNFieldYouFollow,
            @"youMuted": ADNFieldYouMuted,
            @"youCanSubscribe": ADNFieldYouCanSubscribe,
            @"bio": ADNFieldDescription,
            @"followingCount": ADNFieldFollowingCount,
            @"followerCount": ADNFieldFollowerCount,
            @"postCount": ADNFieldPostCount,
            @"starCount": ADNFieldStarCount,
            }];
}


#pragma mark Transformers

+ (NSValueTransformer *)createdAtTransformer
{
    return [NSValueTransformer valueTransformerForName:ADNDateValueTransformerName];
}

@end
