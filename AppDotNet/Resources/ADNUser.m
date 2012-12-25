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

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"annotations"]) {
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                ADNAnnotation *populatedMember = [ADNAnnotation instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            self.annotations = myMembers;
        }
    } else if ([key isEqualToString:@"avatar_image"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.avatarImage = [ADNImage instanceFromDictionary:value];
        }
    } else if ([key isEqualToString:@"counts"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.counts = [ADNCounts instanceFromDictionary:value];
        }
    } else if ([key isEqualToString:@"cover_image"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.coverImage = [ADNImage instanceFromDictionary:value];
        }
    } else if ([key isEqualToString:@"description"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.description = [ADNDescription instanceFromDictionary:value];
        }
    } else if ([key isEqualToString:@"createdAt"]){
        if ([value isKindOfClass:[NSString class]]) {
            self.createdAt = [[ADNHelper dateFormatter] dateFromString:value];
        }
    } else {
        [super setValue:value forKey:key];
    }
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"avatar_image"]) {
        [self setValue:value forKey:@"avatarImage"];
    } else if ([key isEqualToString:@"canonical_url"]) {
        [self setValue:value forKey:@"canonicalURL"];
    } else if ([key isEqualToString:@"cover_image"]) {
        [self setValue:value forKey:@"coverImage"];
    } else if ([key isEqualToString:@"created_at"]) {
        [self setValue:value forKey:@"createdAt"];
    } else if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"userID"];
    } else if ([key isEqualToString:@"follows_you"]) {
        [self setValue:value forKey:@"followsYou"];
    } else if ([key isEqualToString:@"you_follow"]) {
        [self setValue:value forKey:@"youFollow"];
    } else if ([key isEqualToString:@"you_muted"]) {
        [self setValue:value forKey:@"youMuted"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)toDictionary
{
    NSArray *propertyKeys = @[@"id", @"username", @"name", @"description", @"timezone", @"locale", @"avatar_image", @"cover_image", @"type", @"created_at", @"canonical_url", @"counts", @"follows_you", @"you_follow", @"you_muted", @"annotations"];
    return [self dictionaryWithValuesForKeys:propertyKeys];
}

- (id)valueForUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"avatar_image"]) {
        return [self valueForKey:@"avatarImage"];
    } else if ([key isEqualToString:@"canonical_url"]) {
        return [self valueForKey:@"canonicalURL"];
    } else if ([key isEqualToString:@"cover_image"]) {
        return [self valueForKey:@"coverImage"];
    } else if ([key isEqualToString:@"created_at"]) {
        return [self valueForKey:@"createdAt"];
    } else if ([key isEqualToString:@"description"]) {
        return [self valueForKey:@"descriptionText"];
    } else if ([key isEqualToString:@"id"]) {
        return [self valueForKey:@"userID"];
    } else if ([key isEqualToString:@"follows_you"]) {
        return [self valueForKey:@"followsYou"];
    } else if ([key isEqualToString:@"you_follow"]) {
        return [self valueForKey:@"youFollow"];
    } else if ([key isEqualToString:@"you_muted"]) {
        return [self valueForKey:@"youMuted"];
    } else {
        return [super valueForUndefinedKey:key];
    }
}

- (id)valueForKey:(NSString *)key
{
    if ([key isEqualToString:@"annotations"]) {
        NSMutableArray *value = [NSMutableArray arrayWithCapacity:self.annotations.count];
        for (ADNAnnotation *annotation in self.annotations) {
            [value addObject:annotation.toDictionary];
        }
        return value;
    } else if ([key isEqualToString:@"avatar_image"] ||
               [key isEqualToString:@"counts"] ||
               [key isEqualToString:@"cover_image"] ||
               [key isEqualToString:@"description"])
    {
        return ((ADNObject*)[super valueForKey:key]).toDictionary;
    } else if ([key isEqualToString:@"createdAt"]){
        return [[ADNHelper dateFormatter] stringFromDate:self.createdAt];
    } else {
        return [super valueForKey:key];
    }
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
