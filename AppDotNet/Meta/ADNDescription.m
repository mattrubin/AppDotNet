//
//  ADNDescription.m
//  AppDotNet
//
//  Created by Me on 12/24/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNDescription.h"


@implementation ADNDescription

- (NSSet *)conversionKeys
{
    return [NSSet setWithObject:@"entities"];
}

- (NSDictionary *)toDictionary
{
    NSArray *propertyKeys = @[@"text", @"entities", @"html"];
    return [self dictionaryWithValuesForKeys:propertyKeys];
}

@end
