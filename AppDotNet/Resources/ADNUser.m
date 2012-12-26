//
//  ADNUser.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNUser.h"

#import "ADNHelper.h"
#import "NSDictionary+ADN.h"


#define USER_TYPE_STRING_HUMAN          @"human"
#define USER_TYPE_STRING_BOT            @"bot"
#define USER_TYPE_STRING_CORPORATE      @"corporate"
#define USER_TYPE_STRING_FEED           @"feed"


@implementation ADNUser

- (id)init
{
    self = [super init];
    if (self) {
        self.annotations = [ADNAnnotationCollection new];
    }
    return self;
}


#pragma mark Keys

- (NSSet *)conversionKeys
{
    return [NSSet setWithArray:@[USER_KEY_ANNOTATIONS, @"avatarImage", @"coverImage", USER_KEY_COUNTS, USER_KEY_DESCRIPTION, @"createdAt"]];
}

- (NSDictionary *)alteredKeys
{
    return @{USER_KEY_AVATAR_IMAGE: @"avatarImage", USER_KEY_CANONICAL_URL: @"canonicalURL", USER_KEY_COVER_IMAGE: @"coverImage", USER_KEY_CREATED_AT: @"createdAt", USER_KEY_DESCRIPTION: @"descriptionText", USER_KEY_ID: @"userID", USER_KEY_FOLLOWS_YOU: @"followsYou", USER_KEY_YOU_FOLLOW: @"youFollow", USER_KEY_YOU_MUTED: @"youMuted"};
}

- (NSArray *)exportKeys
{
    return @[USER_KEY_ID, USER_KEY_USERNAME, USER_KEY_NAME, USER_KEY_DESCRIPTION, USER_KEY_TIMEZONE, USER_KEY_LOCALE, USER_KEY_AVATAR_IMAGE, USER_KEY_COVER_IMAGE, USER_KEY_TYPE, USER_KEY_CREATED_AT, USER_KEY_CANONICAL_URL, USER_KEY_COUNTS, USER_KEY_FOLLOWS_YOU, USER_KEY_YOU_FOLLOW, USER_KEY_YOU_MUTED, USER_KEY_ANNOTATIONS];
}



#pragma mark -
/*
+ (ADNUserType)typeFromString:(NSString*)typeString
{
    if ([typeString isEqualToString:USER_TYPE_STRING_HUMAN]) {
        return ADNUserTypeHuman;
    } else if ([typeString isEqualToString:USER_TYPE_STRING_BOT]) {
        return ADNUserTypeBot;
    } else if ([typeString isEqualToString:USER_TYPE_STRING_CORPORATE]) {
        return ADNUserTypeCorporate;
    } else if ([typeString isEqualToString:USER_TYPE_STRING_FEED]) {
        return ADNUserTypeFeed;
    }
    return ADNUserTypeUnknown;
}

+ (NSString*)stringFromType:(ADNUserType)type
{
    switch (type) {
        case ADNUserTypeHuman:
            return USER_TYPE_STRING_HUMAN;
        case ADNUserTypeBot:
            return USER_TYPE_STRING_BOT;
        case ADNUserTypeCorporate:
            return USER_TYPE_STRING_CORPORATE;
        case ADNUserTypeFeed:
            return USER_TYPE_STRING_FEED;
        default:
            return nil;
            break;
    }
}

- (void)setTypeString:(NSString *)typeString
{
    self.type = [self.class typeFromString:typeString];
}

- (NSString*)typeString
{
    return [self.class stringFromType:self.type];
}
*/

@end
