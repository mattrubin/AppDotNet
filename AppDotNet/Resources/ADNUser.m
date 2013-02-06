//
//  ADNUser.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNUser.h"


#define USER_TYPE_STRING_HUMAN          @"human"
#define USER_TYPE_STRING_BOT            @"bot"
#define USER_TYPE_STRING_CORPORATE      @"corporate"
#define USER_TYPE_STRING_FEED           @"feed"


@implementation ADNUser

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"avatarImage": KEY_AVATAR_IMAGE,
            @"canonicalURL": KEY_CANONICAL_URL,
            @"coverImage": KEY_COVER_IMAGE,
            @"createdAt": KEY_CREATED_AT,
            @"descriptionText": KEY_DESCRIPTION,
            @"userId": KEY_ID,
            @"followsYou": KEY_FOLLOWS_YOU,
            @"youFollow": KEY_YOU_FOLLOW,
            @"youMuted": KEY_YOU_MUTED,
            @"youCanSubscribe": KEY_YOU_CAN_SUBSCRIBE,
            @"bio": KEY_DESCRIPTION,
            @"followingCount": @"counts.following",
            @"followerCount": @"counts.followers",
            @"postCount": @"counts.posts",
            @"starCount": @"counts.stars",
            }];
}


#pragma mark Transformers

+ (NSValueTransformer *)createdAtTransformer
{
    return [NSValueTransformer valueTransformerForName:ADNDateValueTransformerName];
}

@end
