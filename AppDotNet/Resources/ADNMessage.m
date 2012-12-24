//
//  ADNMessage.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNMessage.h"

#import "ADNEntities.h"
#import "ADNSource.h"
#import "ADNUser.h"


@implementation ADNMessage

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"entities"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.entities = [ADNEntities instanceFromDictionary:value];
        }
    } else if ([key isEqualToString:@"source"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.source = [ADNSource instanceFromDictionary:value];
        }
    } else if ([key isEqualToString:@"user"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.user = [ADNUser instanceFromDictionary:value];
        }
    } else {
        [super setValue:value forKey:key];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"channel_id"]) {
        [self setValue:value forKey:@"channelID"];
    } else if ([key isEqualToString:@"created_at"]) {
        [self setValue:value forKey:@"createdAt"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"messageID"];
    } else if ([key isEqualToString:@"machine_only"]) {
        [self setValue:value forKey:@"machineOnly"];
    } else if ([key isEqualToString:@"num_replies"]) {
        [self setValue:value forKey:@"numReplies"];
    } else if ([key isEqualToString:@"thread_id"]) {
        [self setValue:value forKey:@"threadID"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

@end
