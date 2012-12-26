//
//  ADNSource.m
//  AppDotNet
//
//  Created by Matt Rubin on 12/23/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNSource.h"


@implementation ADNSource

- (NSDictionary *)alteredKeys
{
    return @{@"client_id":@"clientID"};
}

- (NSDictionary *)toDictionary
{
    NSArray *propertyKeys = [NSArray arrayWithObjects:@"client_id",
                                                      @"link",
                                                      @"name",
                                                      nil];
    return [self dictionaryWithValuesForKeys:propertyKeys];
}

@end
