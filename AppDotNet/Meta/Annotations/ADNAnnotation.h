//
//  ADNAnnotation.h
//  AppDotNet
//
//  Created by Matt Rubin on 12/17/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"


/**
 * Annotations are metadata that can be attached to Users, Posts, Channels, or
 * Messages. This allows developers and users to add extra information to
 * App.net objects outside of the fields App.net has already defined.
 *
 * http://developers.app.net/docs/meta/annotations
 */
@interface ADNAnnotation : ADNModel

@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSDictionary *value;

@end
