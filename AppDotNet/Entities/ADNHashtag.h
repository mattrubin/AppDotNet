//
//  ADNHashtag.h
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADNHashtag : NSObject

// The text of the hashtag (not including #).
@property NSString *name;
// The 0 based index where this entity begins text (include #).
@property NSUInteger position;
// The length of the substring in text that represents this hashtag. Since # is included, len will be the length of the name + 1.
@property NSUInteger length;

@end
