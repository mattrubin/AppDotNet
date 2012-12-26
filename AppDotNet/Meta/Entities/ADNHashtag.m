//
//  ADNHashtag.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNHashtag.h"


@implementation ADNHashtag

- (NSDictionary *)alteredKeys
{
    return @{KEY_LEN:@"length", KEY_POS:@"position"};
}

- (NSArray *)exportKeys
{
    return @[KEY_NAME, KEY_POS, KEY_LEN];
}


#pragma mark -

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: %@ (%u @ %u)]", self.class, self.name, self.length, self.position];
}

@end
