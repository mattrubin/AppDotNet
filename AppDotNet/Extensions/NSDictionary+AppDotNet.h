//
//  NSDictionary+AppDotNet.h
//  AppDotNet
//
//  Created by Ben Cochran on 3/2/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (AppDotNet)

- (NSDictionary *)adn_dictionaryByRemovingNullValues;

@end
