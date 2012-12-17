//
//  NSDictionary+ADN.h
//  AppDotNet
//
//  Created by Me on 12/17/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 * Methods to extract specific types of data from a converted JSON response.
 * Accepted types will be converted, unrecognized types will throw an exception.
 */
@interface NSDictionary (ADN)

- (NSDictionary*)dictionaryForKey:(id)aKey;
- (NSArray*)arrayForKey:(id)aKey;
- (NSString*)stringForKey:(id)aKey;
- (BOOL)boolForKey:(id)aKey;
- (NSInteger)integerForKey:(id)aKey;

@end
