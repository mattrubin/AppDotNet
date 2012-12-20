//
//  ADNObject.m
//  AppDotNet
//
//  Created by Me on 12/19/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNObject.h"

@implementation ADNObject

+ (id)instanceFromDictionary:(NSDictionary *)dictionary
{
    ADNObject *instance = [[self alloc] init];
    [instance setAttributesFromDictionary:dictionary];
    return instance;
}

- (void)setAttributesFromDictionary:(NSDictionary *)dictionary
{
    if (![dictionary isKindOfClass:[NSDictionary class]])
        return;
    
    [self setValuesForKeysWithDictionary:dictionary];
}

@end
