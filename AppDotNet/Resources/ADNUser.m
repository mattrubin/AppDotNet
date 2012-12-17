//
//  ADNUser.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNUser.h"



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
        // Initialization
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [self init];
    if (self) {
        [self updateWithDictionary:dictionary];
    }
    return self;
}

+ (id)userFromDictionary:(NSDictionary *)dictionary
{
    return [[ADNUser alloc] initWithDictionary:dictionary];
}


- (void)updateWithDictionary:(NSDictionary *)object
{
    self.userID   = [(NSString*)[object objectForKey:USER_KEY_ID] integerValue];
    self.username = (NSString*)[object objectForKey:USER_KEY_USERNAME];
    self.name     = (NSString*)[object objectForKey:USER_KEY_NAME];
    NSLog(@"User #%u, @%@, \"%@\"", self.userID, self.username, self.name);

    NSDictionary *description = [object objectForKey:USER_KEY_DESCRIPTION];
    self.descriptionText = [description objectForKey:USER_KEY_DESCRIPTION_TEXT];
    self.descriptionHTML = [description objectForKey:USER_KEY_DESCRIPTION_HTML];
    self.descriptionEntities = [ADNEntities entitiesFromDictionary:[description objectForKey:USER_KEY_DESCRIPTION_ENTITIES]];
    NSLog(@"\n%@", self.descriptionText);
    NSLog(@"\n%@", self.descriptionHTML);
    NSLog(@"%@", self.descriptionEntities);
    
    self.timezone = [object objectForKey:USER_KEY_TIMEZONE];
    self.locale   = [object objectForKey:USER_KEY_LOCALE];
    NSLog(@"Time zone: %@, locale: %@", self.timezone, self.locale);
    
    self.avatarImage = [ADNImage imageWithDictionary:[object objectForKey:USER_KEY_AVATAR_IMAGE]];
    self.coverImage  = [ADNImage imageWithDictionary:[object objectForKey:USER_KEY_COVER_IMAGE]];
    NSLog(@"Avatar image: %@", self.avatarImage);
    NSLog(@"Cover image: %@", self.coverImage);
    
    self.type = [ADNUser typeFromString:[object objectForKey:USER_KEY_TYPE]];
    //self.createdAt = [object objectForKey:USER_KEY_CREATED_AT];
    NSLog(@"Type: %@", [ADNUser stringFromType:self.type]);
    
    NSDictionary *counts = [object objectForKey:USER_KEY_COUNTS];
    self.followingCount = [(NSNumber*)[counts objectForKey:USER_KEY_COUNTS_FOLLOWING] unsignedIntegerValue];
    self.followerCount  = [(NSNumber*)[counts objectForKey:USER_KEY_COUNTS_FOLLOWERS] unsignedIntegerValue];
    self.postCount      = [(NSNumber*)[counts objectForKey:USER_KEY_COUNTS_POSTS] unsignedIntegerValue];
    self.starCount      = [(NSNumber*)[counts objectForKey:USER_KEY_COUNTS_STARS] unsignedIntegerValue];
    NSLog(@"Following: %u, Followers: %u, Posts: %u, Stars: %u", self.followingCount, self.followerCount, self.postCount, self.starCount);
    
    self.followsYou = [(NSNumber*)[object objectForKey:USER_KEY_FOLLOWS_YOU] boolValue];
    self.youFollow  = [(NSNumber*)[object objectForKey:USER_KEY_YOU_FOLLOW] boolValue];
    self.youMuted   = [(NSNumber*)[object objectForKey:USER_KEY_YOU_MUTED] boolValue];
    NSLog(@"Follows you: %u, You follow: %u, You muted: %u", self.followsYou, self.youFollow, self.youMuted);
    
    //self.annotations =[object objectForKey:USER_KEY_YOU_MUTED];
}

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


@end
