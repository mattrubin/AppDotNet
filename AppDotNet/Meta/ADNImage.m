//
//  ADNImage.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNImage.h"


@implementation ADNImage

- (NSArray *)exportKeys
{
    return @[KEY_HEIGHT, KEY_WIDTH, KEY_URL];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: (%u x %u) %@]", self.class, self.width, self.height, self.url];
}

@end
