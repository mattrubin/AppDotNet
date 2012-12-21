//
//  ADNLink.h
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADNObject.h"


@interface ADNLink : ADNObject

// The anchor text to be linked (could be a url).
@property (nonatomic, copy) NSString *text;
// The destination url (only http or https accepted).
@property (nonatomic, copy) NSString *url;
// The 0 based index where this entity begins text.
@property (nonatomic, assign) NSUInteger position;
// The length of the substring in text that represents this link.
@property (nonatomic, assign) NSUInteger length;

@end
