//
//  NSDictionary+AppDotNet.m
//  AppDotNet
//
//  Created by Ben Cochran on 3/2/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NSDictionary+AppDotNet.h"

@implementation NSDictionary (AppDotNet)

- (NSDictionary *)adn_dictionaryByRemovingNullValues
{
    NSArray *keys = [self allKeys];
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:[keys count]];
    for (id key in keys) {
        id object = [self objectForKey:key];
        if (object == [NSNull null]) {
            continue;
        }
        if ([object isKindOfClass:[NSDictionary class]]) {
            object = [object adn_dictionaryByRemovingNullValues];
        }
        [result setObject:object forKey:key];
    }
    return result;
}

@end
