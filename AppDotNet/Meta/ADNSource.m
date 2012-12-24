//
//  ADNSource.m
//  AppDotNet
//
//  Created by Matt Rubin on 12/23/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNSource.h"


@implementation ADNSource

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"client_id"]) {
        [self setValue:value forKey:@"clientID"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)toDictionary
{
    NSArray *propertyKeys = [NSArray arrayWithObjects:@"client_id",
                                                      @"link",
                                                      @"name",
                                                      nil];
    return [self dictionaryWithValuesForKeys:propertyKeys];
}

- (id)valueForUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"client_id"]) {
        return [self valueForKey:@"clientID"];
    } else {
        return [super valueForUndefinedKey:key];
    }
}

@end
