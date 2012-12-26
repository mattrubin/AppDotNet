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
    return [NSSet setWithArray:@[KEY_ANNOTATIONS, @"avatarImage", @"coverImage", KEY_COUNTS, KEY_DESCRIPTION, @"createdAt"]];
}

- (NSDictionary *)alteredKeys
{
    return @{KEY_AVATAR_IMAGE: @"avatarImage", KEY_CANONICAL_URL: @"canonicalURL", KEY_COVER_IMAGE: @"coverImage", KEY_CREATED_AT: @"createdAt", KEY_DESCRIPTION: @"descriptionText", KEY_ID: @"userID", KEY_FOLLOWS_YOU: @"followsYou", KEY_YOU_FOLLOW: @"youFollow", KEY_YOU_MUTED: @"youMuted"};
}

- (NSArray *)exportKeys
{
    return @[KEY_ID, KEY_USERNAME, KEY_NAME, KEY_DESCRIPTION, KEY_TIMEZONE, KEY_LOCALE, KEY_AVATAR_IMAGE, KEY_COVER_IMAGE, KEY_TYPE, KEY_CREATED_AT, KEY_CANONICAL_URL, KEY_COUNTS, KEY_FOLLOWS_YOU, KEY_YOU_FOLLOW, KEY_YOU_MUTED, KEY_ANNOTATIONS];
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
