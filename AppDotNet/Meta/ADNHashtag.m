//
//  ADNHashtag.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNHashtag.h"

#import "NSDictionary+ADN.h"


@implementation ADNHashtag

- (NSDictionary *)alteredKeys
{
    return @{@"len":@"length", @"pos":@"position"};
}

- (NSDictionary *)toDictionary
{
    NSArray *propertyKeys = [NSArray arrayWithObjects:@"name", @"pos", @"len", nil];
    return [self dictionaryWithValuesForKeys:propertyKeys];
}


#pragma mark -

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: %@ (%u @ %u)]", self.class, self.name, self.length, self.position];
}

@end
