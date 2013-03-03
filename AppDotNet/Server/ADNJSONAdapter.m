//
//  ADNJSONAdapter.m
//  AppDotNet
//
//  Created by Ben Cochran on 3/2/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNJSONAdapter.h"

#import "NSDictionary+AppDotNet.h"

@implementation ADNJSONAdapter

- (NSDictionary *)JSONDictionary
{
    return [[super JSONDictionary] adn_dictionaryByRemovingNullValues];
}

@end
