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

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"hasUnread": KEY_HAS_UNREAD,
            @"channelId": KEY_ID,
            @"youCanEdit": KEY_YOU_CAN_EDIT,
            @"youSubscribed": KEY_YOU_SUBSCRIBED,
            @"recentMessageId": KEY_RECENT_MESSAGE_ID,
            }];
}



#pragma mark Utility

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@ #%i: %@, @%@]", self.class, [self.channelId intValue], self.type, self.owner.username];
}

@end
