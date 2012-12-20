//
//  ADNMention.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNMention.h"

#import "NSDictionary+ADN.h"


#define MENTION_KEY_ID          @"id"
#define MENTION_KEY_USERNAME    @"name"
#define MENTION_KEY_POSITION    @"pos"
#define MENTION_KEY_LENGTH      @"len"


@implementation ADNMention

- (void)setAttributesFromDictionary:(NSDictionary *)dictionary
{
    self.username = [dictionary stringForKey:MENTION_KEY_USERNAME];
    self.userID   = [dictionary integerForKey:MENTION_KEY_ID];
    self.position = [dictionary integerForKey:MENTION_KEY_POSITION];
    self.length   = [dictionary integerForKey:MENTION_KEY_LENGTH];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: #%u @%@ (%u @ %u)]", self.class, self.userID, self.username, self.length, self.position];
}

@end
