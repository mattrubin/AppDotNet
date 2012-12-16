//
//  ADNImage.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNImage.h"

#define IMAGE_KEY_HEIGHT    @"height"
#define IMAGE_KEY_WIDTH     @"width"
#define IMAGE_KEY_URL       @"url"


@implementation ADNImage

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        [self updateWithDictionary:dictionary];
    }
    return self;
}

+ (id)imageWithDictionary:(NSDictionary*)dictionary
{
    return [[ADNImage alloc] initWithDictionary:dictionary];
}


- (void)updateWithDictionary:(NSDictionary*)dictionary
{
    self.height = [[dictionary objectForKey:IMAGE_KEY_HEIGHT] unsignedIntegerValue];
    self.width  = [[dictionary objectForKey:IMAGE_KEY_WIDTH] unsignedIntegerValue];
    self.url    = [dictionary objectForKey:IMAGE_KEY_URL];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: (%u x %u) %@]", self.class, self.width, self.height, self.url];
}

@end
