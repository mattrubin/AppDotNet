//
//  NSDictionary+ADN.m
//  AppDotNet
//
//  Created by Me on 12/17/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "NSDictionary+ADN.h"

#define INVALID_DATA @"Invalid Data"
#define INVALID_DATA_FORMAT @"Cannot convert \"%@\" to %@: %@ (%@)"


@implementation NSDictionary (ADN)


- (NSDictionary*)dictionaryForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        return object;
    }
    
    [NSException raise:INVALID_DATA format:INVALID_DATA_FORMAT, aKey, [NSDictionary class], object, [object class]];
    return NO;
}

- (NSArray*)arrayForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSArray class]]) {
        return object;
    }
    
    [NSException raise:INVALID_DATA format:INVALID_DATA_FORMAT, aKey, [NSArray class], object, [object class]];
    return NO;
}

- (NSString*)stringForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    } else if ([object isKindOfClass:[NSNumber class]]) {
        return [object stringValue];
    }
    
    [NSException raise:INVALID_DATA format:INVALID_DATA_FORMAT, aKey, [NSString class], object, [object class]];
    return nil;
}


- (BOOL)boolForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber*)object boolValue];
    }
    
    [NSException raise:INVALID_DATA format:INVALID_DATA_FORMAT, aKey, @"BOOL", object, [object class]];
    return NO;
}

- (NSInteger)integerForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    
    if ([object isKindOfClass:[NSString class]]) {
        return [(NSString*)object integerValue];
    } else if ([object isKindOfClass:[NSNumber class]]) {
        return [(NSNumber*)object integerValue];
    }
    
    [NSException raise:INVALID_DATA format:INVALID_DATA_FORMAT, aKey, @"NSInteger", object, [object class]];
    return 0;
}

@end
