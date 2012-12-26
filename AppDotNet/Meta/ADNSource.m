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
    return @{KEY_CLIENT_ID:@"clientID"};
}

- (NSArray *)exportKeys
{
    return @[KEY_CLIENT_ID, KEY_LINK, KEY_NAME];
}

@end
