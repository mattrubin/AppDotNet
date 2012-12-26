//
//  ADNObject.h
//  AppDotNet
//
//  Created by Me on 12/19/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADNObject : NSObject

+ (id)instanceFromDictionary:(NSDictionary *)dictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

- (NSSet *)conversionKeys;
- (NSDictionary *)alteredKeys;

@end
