//
//  ADNHashtag.h
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"


/**
 * Tag a post about a specific subject. A hashtag starts with `#`.
 * 
 * http://developers.app.net/docs/meta/entities/#hashtags
 */
@interface ADNHashtag : ADNModel

/// The text of the hashtag (not including `#`).
@property (nonatomic, copy) NSString *name;

/// The 0-based index where this entity begins in `text` (include `#`).
@property (nonatomic, assign) NSUInteger position;

/// The length of the substring in `text` that represents this hashtag.
/// Since `#` is included, `length` will be the length of the `name` + 1.
@property (nonatomic, assign) NSUInteger length;

@end
