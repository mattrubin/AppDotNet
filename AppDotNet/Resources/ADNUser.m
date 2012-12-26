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


#define USER_KEY_ID                     @"id"
#define USER_KEY_USERNAME               @"username"
#define USER_KEY_NAME                   @"name"

#define USER_KEY_DESCRIPTION            @"description"
#define USER_KEY_DESCRIPTION_TEXT       @"text"
#define USER_KEY_DESCRIPTION_HTML       @"html"
#define USER_KEY_DESCRIPTION_ENTITIES   @"entities"

#define USER_KEY_TIMEZONE               @"timezone"
#define USER_KEY_LOCALE                 @"locale"

#define USER_KEY_AVATAR_IMAGE           @"avatar_image"
#define USER_KEY_COVER_IMAGE            @"cover_image"

#define USER_KEY_TYPE                   @"type"
#define USER_KEY_CREATED_AT             @"created_at"

#define USER_KEY_COUNTS                 @"counts"
#define USER_KEY_COUNTS_FOLLOWING       @"following"
#define USER_KEY_COUNTS_FOLLOWERS       @"followers"
#define USER_KEY_COUNTS_POSTS           @"posts"
#define USER_KEY_COUNTS_STARS           @"stars"

#define USER_KEY_FOLLOWS_YOU            @"follows_you"
#define USER_KEY_YOU_FOLLOW             @"you_follow"
#define USER_KEY_YOU_MUTED              @"you_muted"

#define USER_KEY_ANNOTATIONS            @"annotations"


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

- (NSSet *)conversionKeys
{
    return [NSSet setWithArray:@[@"annotations", @"avatarImage", @"coverImage", @"counts", @"description", @"createdAt"]];
}

- (NSDictionary *)alteredKeys
{
    return @{@"avatar_image": @"avatarImage", @"canonical_url": @"canonicalURL", @"cover_image": @"coverImage", @"created_at": @"createdAt", @"description": @"descriptionText", @"id": @"userID", @"follows_you": @"followsYou", @"you_follow": @"youFollow", @"you_muted": @"youMuted"};
}

- (NSArray *)exportKeys
{
    return @[@"id", @"username", @"name", @"description", @"timezone", @"locale", @"avatar_image", @"cover_image", @"type", @"created_at", @"canonical_url", @"counts", @"follows_you", @"you_follow", @"you_muted", @"annotations"];
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
