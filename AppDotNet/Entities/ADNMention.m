//
//  ADNMention.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNMention.h"

#define MENTION_KEY_ID          @"id"
#define MENTION_KEY_USERNAME    @"name"
#define MENTION_KEY_POSITION    @"pos"
#define MENTION_KEY_LENGTH      @"len"


@implementation ADNMention

/*
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization
    }
    return self;
}
*/

- (id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [self init];
    if (self) {
        [self updateWithDictionary:dictionary];
    }
    return self;
}

+ (id)mentionFromDictionary:(NSDictionary*)dictionary
{
    return [[ADNMention alloc] initWithDictionary:dictionary];
}

- (void)updateWithDictionary:(NSDictionary*)dictionary
{
    self.username = [dictionary objectForKey:MENTION_KEY_USERNAME];
    self.userID   = [(NSString*)[dictionary objectForKey:MENTION_KEY_ID] integerValue];
    self.position = [(NSNumber*)[dictionary objectForKey:MENTION_KEY_POSITION] integerValue];
    self.length   = [(NSNumber*)[dictionary objectForKey:MENTION_KEY_LENGTH] integerValue];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: #%u @%@ (%u @ %u)]", self.class, self.userID, self.username, self.length, self.position];
}

@end
