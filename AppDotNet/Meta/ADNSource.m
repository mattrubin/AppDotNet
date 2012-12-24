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
        [self setValue:value forKey:@"clientId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

@end
