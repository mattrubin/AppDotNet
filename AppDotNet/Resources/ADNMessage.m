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

- (NSArray *)exportKeys
{
    return @[@"channel_id", @"created_at", @"entities", @"html", @"id", @"machine_only", @"num_replies", @"source", @"text", @"thread_id", @"user", @"reply_to", @"is_deleted", @"annotations"];
}

@end
