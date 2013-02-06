//
//  ADNMention.h
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"


/**
 * Bring another user’s attention to your post. A mention starts with `@`.
 * 
 * http://developers.app.net/docs/meta/entities/#mentions
 */
@interface ADNMention : ADNModel

/// The username being mentioned (doesn't include `@`).
@property (nonatomic, copy) NSString *username;

/// The user `id` of the mentioned user.
@property (nonatomic, copy) NSString *userId;

/// The 0-based index where this entity begins in `text` (include `@`).
@property (nonatomic, assign) NSUInteger position;

/// The length of the substring in `text` that represents this mention.
/// Since `@` is included, `length` will be the length of the `username` + 1.
@property (nonatomic, assign) NSUInteger length;

@end
