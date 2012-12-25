//
//  ADNChannel.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNChannel.h"

#define CHANNEL_KEY_ID                  @"id"
#define CHANNEL_KEY_TYPE                @"type"
#define CHANNEL_KEY_OWNER               @"owner"
#define CHANNEL_KEY_READERS             @"readers"
#define CHANNEL_KEY_WRITERS             @"writers"
#define CHANNEL_KEY_HAS_UNREAD          @"has_unread"
#define CHANNEL_KEY_YOU_CAN_EDIT        @"you_can_edit"
#define CHANNEL_KEY_YOU_SUBSCRIBED      @"you_subscribed"
#define CHANNEL_KEY_ANNOTATIONS         @"annotations"
#define CHANNEL_KEY_RECENT_MESSAGE_ID   @"recent_message_id"


@implementation ADNChannel

- (id)init
{
    self = [super init];
    if (self) {
        self.annotations = [ADNAnnotationCollection new];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    
    if ([key isEqualToString:CHANNEL_KEY_ANNOTATIONS]) {
        
        if ([value isKindOfClass:[NSArray class]]) {
            self.annotations = [ADNAnnotationCollection instanceFromArray:value];
        }
        
    } else if ([key isEqualToString:CHANNEL_KEY_OWNER]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.owner = [ADNUser instanceFromDictionary:value];
        }
        
    } else if ([key isEqualToString:CHANNEL_KEY_READERS]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.readers = [ADNAccessControlList instanceFromDictionary:value];
        }
        
    } else if ([key isEqualToString:CHANNEL_KEY_WRITERS]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.writers = [ADNAccessControlList instanceFromDictionary:value];
        }
        
    } else {
        [super setValue:value forKey:key];
    }
    
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:CHANNEL_KEY_HAS_UNREAD]) {
        [self setValue:value forKey:@"hasUnread"];
    } else if ([key isEqualToString:CHANNEL_KEY_ID]) {
        [self setValue:value forKey:@"channelID"];
    } else if ([key isEqualToString:CHANNEL_KEY_YOU_CAN_EDIT]) {
        [self setValue:value forKey:@"youCanEdit"];
    } else if ([key isEqualToString:CHANNEL_KEY_YOU_SUBSCRIBED]) {
        [self setValue:value forKey:@"youSubscribed"];
    } else if ([key isEqualToString:CHANNEL_KEY_RECENT_MESSAGE_ID]) {
        [self setValue:value forKey:@"recentMessageID"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
    
}


- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@ #%i: %@, @%@]", self.class, [self.channelID intValue], self.type, self.owner.username];
}

- (NSDictionary *)toDictionary
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    if (self.channelID)
        [dictionary setObject:self.channelID       forKey:CHANNEL_KEY_ID];
    if (self.type)
        [dictionary setObject:self.type            forKey:CHANNEL_KEY_TYPE];
    if (self.recentMessageID)
        [dictionary setObject:self.recentMessageID forKey:CHANNEL_KEY_RECENT_MESSAGE_ID];
    
    [dictionary setObject:[NSNumber numberWithBool:self.hasUnread]     forKey:CHANNEL_KEY_HAS_UNREAD];
    [dictionary setObject:[NSNumber numberWithBool:self.youCanEdit]    forKey:CHANNEL_KEY_YOU_CAN_EDIT];
    [dictionary setObject:[NSNumber numberWithBool:self.youSubscribed] forKey:CHANNEL_KEY_YOU_SUBSCRIBED];
    
    if (self.owner)
        [dictionary setObject:self.owner.toDictionary forKey:CHANNEL_KEY_OWNER];
    if (self.readers)
        [dictionary setObject:self.readers.toDictionary forKey:CHANNEL_KEY_READERS];
    if (self.writers)
        [dictionary setObject:self.writers.toDictionary forKey:CHANNEL_KEY_WRITERS];
    if (self.annotations)
        [dictionary setObject:self.annotations.toArray forKey:CHANNEL_KEY_ANNOTATIONS];
    
    return dictionary;
}

@end
