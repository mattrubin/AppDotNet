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
    return [NSSet setWithArray:@[@"annotations", @"entities", @"source", @"user", @"createdAt"]];
}

- (NSDictionary *)alteredKeys
{
    return @{@"channel_id":@"channelID", @"created_at":@"createdAt", @"id":@"messageID", @"machine_only":@"machineOnly", @"num_replies":@"numReplies", @"thread_id":@"threadID", @"reply_to":@"replyToID", @"is_deleted":@"isDeleted"};
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

@end
