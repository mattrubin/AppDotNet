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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"len"]) {
        [self setValue:value forKey:@"length"];
    } else if ([key isEqualToString:@"pos"]) {
        [self setValue:value forKey:@"position"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)toDictionary
{
    NSArray *propertyKeys = [NSArray arrayWithObjects:@"name", @"pos", @"len", nil];
    return [self dictionaryWithValuesForKeys:propertyKeys];
}

- (id)valueForUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"len"]) {
        return [self valueForKey:@"length"];
    } else if ([key isEqualToString:@"pos"]) {
        return [self valueForKey:@"position"];
    } else {
        return [super valueForUndefinedKey:key];
    }
}


#pragma mark -

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: %@ (%u @ %u)]", self.class, self.name, self.length, self.position];
}

@end
