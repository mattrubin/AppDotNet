//
//  ADNMessage.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNMessage.h"
#import "ADNHelper.h"
#import "ADNEntities.h"
#import "ADNSource.h"
#import "ADNUser.h"


@implementation ADNMessage

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"annotations"]) {
        if ([value isKindOfClass:[NSArray class]]) {
            self.annotations = [ADNAnnotationCollection instanceFromArray:value];
        }
    } else if ([key isEqualToString:@"entities"]) {
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
    } else if ([key isEqualToString:@"reply_to"]) {
        [self setValue:value forKey:@"replyToID"];
    } else if ([key isEqualToString:@"is_deleted"]) {
        [self setValue:value forKey:@"isDeleted"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)toDictionary
{
    NSArray *propertyKeys = [NSArray arrayWithObjects:@"channel_id",
                                                      @"created_at",
                                                      @"entities",
                                                      @"html",
                                                      @"id",
                                                      @"machine_only",
                                                      @"num_replies",
                                                      @"source",
                                                      @"text",
                                                      @"thread_id",
                                                      @"user",
                                                      @"reply_to",
                                                      @"is_deleted",
                                                      @"annotations",
                                                      nil];
    return [self dictionaryWithValuesForKeys:propertyKeys];
}

- (id)valueForUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"channel_id"]) {
        return [self valueForKey:@"channelID"];
    } else if ([key isEqualToString:@"created_at"]) {
        return [self valueForKey:@"createdAt"];
    } else if ([key isEqualToString:@"id"]) {
        return [self valueForKey:@"messageID"];
    } else if ([key isEqualToString:@"machine_only"]) {
        return [self valueForKey:@"machineOnly"];
    } else if ([key isEqualToString:@"num_replies"]) {
        return [self valueForKey:@"numReplies"];
    } else if ([key isEqualToString:@"thread_id"]) {
        return [self valueForKey:@"threadID"];
    } else if ([key isEqualToString:@"reply_to"]) {
        return [self valueForKey:@"replyToID"];
    } else if ([key isEqualToString:@"is_deleted"]) {
        return [self valueForKey:@"isDeleted"];
    } else {
        return [super valueForUndefinedKey:key];
    }
}

- (id)valueForKey:(NSString *)key
{
    if ([key isEqualToString:@"annotations"]) {
        return self.annotations.toArray;
    } else if ([key isEqualToString:@"entities"] ||
        [key isEqualToString:@"source"] ||
        [key isEqualToString:@"user"])
    {
        return ((ADNObject*)[super valueForKey:key]).toDictionary;
    } else if ([key isEqualToString:@"createdAt"]){
        return [[ADNHelper dateFormatter] stringFromDate:self.createdAt];
    } else {
        return [super valueForKey:key];
    }
}

@end
