//
//  ADNSource.h
//  AppDotNet
//
//  Created by Matt Rubin on 12/23/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"


/**
 * Info about the API consumer that created a post, message, or file.
 *
 * http://developers.app.net/docs/resources/post/#post-fields
 */
@interface ADNSource : ADNModel

@property (nonatomic, copy) NSString *clientId;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *name;

@end
