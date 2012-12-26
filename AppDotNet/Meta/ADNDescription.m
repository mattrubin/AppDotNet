//
//  ADNDescription.m
//  AppDotNet
//
//  Created by Me on 12/24/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNDescription.h"


@implementation ADNDescription

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"entities"]) {
        [self setValue:value toClass:[ADNEntities class] forKey:key];
    } else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)toDictionary
{
    NSArray *propertyKeys = @[@"text", @"entities", @"html"];
    return [self dictionaryWithValuesForKeys:propertyKeys];
}

- (id)valueForKey:(NSString *)key
{
    if ([key isEqualToString:@"entities"]) {
        return self.entities.toDictionary;
    } else {
        return [super valueForKey:key];
    }
}

@end
