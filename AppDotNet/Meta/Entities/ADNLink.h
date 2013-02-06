//
//  ADNLink.h
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"


/**
 * Link to another website.
 */
@interface ADNLink : ADNModel

/// The anchor text to be linked (could be a url).
@property (nonatomic, copy) NSString *text;

/// The destination url (only http or https accepted).
@property (nonatomic, copy) NSURL *url;

/// The 0-based index where this entity begins in `text`.
@property (nonatomic, assign) NSUInteger position;

/// The length of the substring in `text` that represents this link.
@property (nonatomic, assign) NSUInteger length;

/// The length of the substring in `text` that represents this link including any phishing
/// protection that was inserted by App.net. This can be used to customize the display of the
/// anti-phishing information we provide. If this link has no anti-phishing protection (because the
/// domain of the `url` matches the `text`), then this field will be omitted.
@property (nonatomic, assign) NSUInteger amendedLength;


@end
