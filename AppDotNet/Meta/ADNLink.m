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

- (NSDictionary *)toDictionary
{
    NSArray *propertyKeys = [NSArray arrayWithObjects:@"text", @"url", @"pos", @"len", nil];
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
    return [NSString stringWithFormat:@"[%@: %@ (%u @ %u) <%@>]", self.class, self.text, self.length, self.position, self.url];
}

@end
