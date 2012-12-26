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

- (NSArray *)exportKeys
{
    return @[@"client_id", @"link", @"name"];
}

@end
