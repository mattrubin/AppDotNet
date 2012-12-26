//
//  ADNDescription.m
//  AppDotNet
//
//  Created by Me on 12/24/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNDescription.h"


@implementation ADNDescription

- (NSSet *)conversionKeys
{
    return [NSSet setWithObject:KEY_ENTITIES];
}

- (NSArray *)exportKeys
{
    return @[KEY_TEXT, KEY_ENTITIES, KEY_HTML];
}

@end
