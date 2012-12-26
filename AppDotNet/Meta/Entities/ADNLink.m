//
//  ADNLink.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNLink.h"


@implementation ADNLink

- (NSDictionary *)alteredKeys
{
    return @{KEY_LEN:@"length", KEY_POS:@"position"};
}

- (NSArray *)exportKeys
{
    return @[KEY_TEXT, KEY_URL, KEY_POS, KEY_LEN];
}


#pragma mark -

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: %@ (%u @ %u) <%@>]", self.class, self.text, self.length, self.position, self.url];
}

@end
