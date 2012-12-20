//
//  ADNImage.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNImage.h"

#import "NSDictionary+ADN.h"


#define IMAGE_KEY_HEIGHT    @"height"
#define IMAGE_KEY_WIDTH     @"width"
#define IMAGE_KEY_URL       @"url"


@implementation ADNImage

- (void)setAttributesFromDictionary:(NSDictionary *)dictionary
{
    self.height = [dictionary integerForKey:IMAGE_KEY_HEIGHT];
    self.width  = [dictionary integerForKey:IMAGE_KEY_WIDTH];
    self.url    = [dictionary stringForKey:IMAGE_KEY_URL];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: (%u x %u) %@]", self.class, self.width, self.height, self.url];
}

@end
