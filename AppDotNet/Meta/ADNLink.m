//
//  ADNLink.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNLink.h"

#import "NSDictionary+ADN.h"


@implementation ADNLink

- (NSDictionary *)alteredKeys
{
    return @{@"len":@"length", @"pos":@"position"};
}

- (NSArray *)exportKeys
{
    return @[@"text", @"url", @"pos", @"len"];
}


#pragma mark -

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: %@ (%u @ %u) <%@>]", self.class, self.text, self.length, self.position, self.url];
}

@end
