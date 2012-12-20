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

- (void)setValue:(id)value forKey:(NSString *)key {
    
    
    if ([key isEqualToString:CHANNEL_KEY_ANNOTATIONS]) {
        
        if ([value isKindOfClass:[NSArray class]]) {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                ADNAnnotation *populatedMember = [ADNAnnotation instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.annotations = myMembers;
            
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
    
    [dictionary setObject:self.channelID       forKey:CHANNEL_KEY_ID];
    [dictionary setObject:self.type            forKey:CHANNEL_KEY_TYPE];
    [dictionary setObject:self.recentMessageID forKey:CHANNEL_KEY_RECENT_MESSAGE_ID];
    
    [dictionary setObject:[NSNumber numberWithBool:self.hasUnread]     forKey:CHANNEL_KEY_HAS_UNREAD];
    [dictionary setObject:[NSNumber numberWithBool:self.youCanEdit]    forKey:CHANNEL_KEY_YOU_CAN_EDIT];
    [dictionary setObject:[NSNumber numberWithBool:self.youSubscribed] forKey:CHANNEL_KEY_YOU_SUBSCRIBED];
    
#warning Channel.toDictionary incomplete: currently ignoring owner object
    //[dictionary setObject:self.owner.toDictionary forKey:CHANNEL_KEY_OWNER];
    [dictionary setObject:self.readers.toDictionary forKey:CHANNEL_KEY_READERS];
    [dictionary setObject:self.writers.toDictionary forKey:CHANNEL_KEY_WRITERS];
    
    NSMutableArray *annotationsArray = [NSMutableArray arrayWithCapacity:self.annotations.count];
    for (NSUInteger i=0; i<self.annotations.count; i++) {
        ADNAnnotation *annotation = [self.annotations objectAtIndex:i];
        [annotationsArray insertObject:annotation.toDictionary atIndex:i];
    }
    [dictionary setObject:annotationsArray forKey:CHANNEL_KEY_ANNOTATIONS];
    
    return dictionary;
}

@end
