//
//  ADNLink.h
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADNLink : NSObject

// The anchor text to be linked (could be a url).
@property NSString *text;
// The destination url (only http or https accepted).
@property NSString *url;
// The 0 based index where this entity begins text.
@property NSUInteger position;
// The length of the substring in text that represents this link.
@property NSUInteger length;

@end
