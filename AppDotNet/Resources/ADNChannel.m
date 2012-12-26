//
//  ADNChannel.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNChannel.h"


@implementation ADNChannel

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
    return [NSSet setWithArray:@[KEY_ANNOTATIONS, KEY_OWNER, KEY_READERS, KEY_WRITERS]];
}

- (NSDictionary *)alteredKeys
{
    return @{KEY_HAS_UNREAD:@"hasUnread", KEY_ID:@"channelID", KEY_YOU_CAN_EDIT:@"youCanEdit", KEY_YOU_SUBSCRIBED:@"youSubscribed", KEY_RECENT_MESSAGE_ID:@"recentMessageID"};
}

- (NSArray *)exportKeys
{
    return @[KEY_ID, KEY_TYPE, KEY_OWNER, KEY_ANNOTATIONS, KEY_READERS, KEY_WRITERS, KEY_YOU_SUBSCRIBED, KEY_YOU_CAN_EDIT, KEY_HAS_UNREAD, KEY_RECENT_MESSAGE_ID];
}


#pragma mark Utility

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@ #%i: %@, @%@]", self.class, [self.channelID intValue], self.type, self.owner.username];
}

@end
