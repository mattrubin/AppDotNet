//
//  ADNCounts.m
//  AppDotNet
//
//  Created by Me on 12/24/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNCounts.h"


@implementation ADNCounts

- (NSDictionary *)toDictionary
{
    NSArray *propertyKeys = @[@"followers", @"following", @"posts", @"stars"];
    return [self dictionaryWithValuesForKeys:propertyKeys];
}

@end
