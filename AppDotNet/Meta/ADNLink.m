//
//  ADNLink.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNLink.h"

#import "NSDictionary+ADN.h"


#define LINK_KEY_TEXT       @"text"
#define LINK_KEY_URL        @"url"
#define LINK_KEY_POSITION   @"pos"
#define LINK_KEY_LENGTH     @"len"


@implementation ADNLink

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

+ (id)linkFromDictionary:(NSDictionary*)dictionary
{
    return [[ADNLink alloc] initWithDictionary:dictionary];
}

- (void)updateWithDictionary:(NSDictionary*)dictionary
{
    self.text     = [dictionary stringForKey:LINK_KEY_TEXT];
    self.url      = [dictionary stringForKey:LINK_KEY_URL];
    self.position = [dictionary integerForKey:LINK_KEY_POSITION];
    self.length   = [dictionary integerForKey:LINK_KEY_LENGTH];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: %@ (%u @ %u) <%@>]", self.class, self.text, self.length, self.position, self.url];
}

@end
