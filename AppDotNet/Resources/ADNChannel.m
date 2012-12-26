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
#define CHANNEL_KEY_ANNOTATIONS         @"annotations"
#define CHANNEL_KEY_READERS             @"readers"
#define CHANNEL_KEY_WRITERS             @"writers"
#define CHANNEL_KEY_YOU_SUBSCRIBED      @"you_subscribed"
#define CHANNEL_KEY_YOU_CAN_EDIT        @"you_can_edit"
#define CHANNEL_KEY_HAS_UNREAD          @"has_unread"
#define CHANNEL_KEY_RECENT_MESSAGE_ID   @"recent_message_id"


@implementation ADNChannel

#pragma mark Initilaization

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
    return [NSSet setWithArray:@[CHANNEL_KEY_ANNOTATIONS, CHANNEL_KEY_OWNER, CHANNEL_KEY_READERS, CHANNEL_KEY_WRITERS]];
}

- (NSDictionary *)alteredKeys
{
    return @{CHANNEL_KEY_HAS_UNREAD:@"hasUnread", CHANNEL_KEY_ID:@"channelID", CHANNEL_KEY_YOU_CAN_EDIT:@"youCanEdit", CHANNEL_KEY_YOU_SUBSCRIBED:@"youSubscribed", CHANNEL_KEY_RECENT_MESSAGE_ID:@"recentMessageID"};
}


#pragma mark Export

- (NSArray *)exportKeys
{
    return @[CHANNEL_KEY_ID, CHANNEL_KEY_TYPE, CHANNEL_KEY_OWNER, CHANNEL_KEY_ANNOTATIONS, CHANNEL_KEY_READERS, CHANNEL_KEY_WRITERS, CHANNEL_KEY_YOU_SUBSCRIBED, CHANNEL_KEY_YOU_CAN_EDIT, CHANNEL_KEY_HAS_UNREAD, CHANNEL_KEY_RECENT_MESSAGE_ID];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@ #%i: %@, @%@]", self.class, [self.channelID intValue], self.type, self.owner.username];
}

@end
