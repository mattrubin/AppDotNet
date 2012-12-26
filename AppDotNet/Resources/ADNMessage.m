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


#pragma mark Keys

- (NSSet *)conversionKeys
{
    return [NSSet setWithArray:@[KEY_ANNOTATIONS, KEY_ENTITIES, KEY_SOURCE, KEY_USER, @"createdAt"]];
}

- (NSDictionary *)alteredKeys
{
    return @{KEY_CHANNEL_ID:@"channelID", KEY_CREATED_AT:@"createdAt", KEY_ID:@"messageID", KEY_MACHINE_ONLY:@"machineOnly", KEY_NUM_REPLIES:@"numReplies", KEY_THREAD_ID:@"threadID", KEY_REPLY_TO:@"replyToID", KEY_IS_DELETED:@"isDeleted"};
}

- (NSArray *)exportKeys
{
    return @[KEY_CHANNEL_ID, KEY_CREATED_AT, KEY_ENTITIES, KEY_HTML, KEY_ID, KEY_MACHINE_ONLY, KEY_NUM_REPLIES, KEY_SOURCE, KEY_TEXT, KEY_THREAD_ID, KEY_USER, KEY_REPLY_TO, KEY_IS_DELETED, KEY_ANNOTATIONS];
}

@end
