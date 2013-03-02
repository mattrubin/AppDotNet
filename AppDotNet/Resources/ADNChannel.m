//
//  ADNChannel.m
//  AppDotNet
//
//  Created by Matt Rubin on 12/15/12.
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [super.JSONKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"hasUnread": ADNFieldHasUnread,
            @"channelId": ADNFieldId,
            @"youCanEdit": ADNFieldYouCanEdit,
            @"youSubscribed": ADNFieldYouSubscribed,
            @"recentMessageId": ADNFieldRecentMessageId,
            }];
}



#pragma mark Utility

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@ #%i: %@, @%@]", self.class, [self.channelId intValue], self.type, self.owner.username];
}

@end
