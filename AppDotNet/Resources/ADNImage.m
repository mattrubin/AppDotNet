//
//  ADNImage.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNImage.h"

#import "NSDictionary+ADN.h"


@implementation ADNImage

- (NSDictionary *)toDictionary
{
    NSArray *propertyKeys = @[@"height", @"width", @"url"];
    return [self dictionaryWithValuesForKeys:propertyKeys];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: (%u x %u) %@]", self.class, self.width, self.height, self.url];
}

@end
