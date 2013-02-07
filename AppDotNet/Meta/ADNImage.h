//
//  ADNImage.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"


/**
 * Images are objects so that app developers can more easily pick the
 * appropriately sized image for different contexts.
 * 
 * Images may be dynamically resized on the server by adding `w` and/or `h`
 * parameters to the query string of the URL as desired. If one of the
 * parameters is omitted, the omitted dimension will be scaled according to the
 * aspect ratio of the original image. Images will be returned with HTTPS URLs,
 * but can be fetched over HTTP if desired.
 * 
 * Currently, gif images can not be resized with the `w` and `h` parameters.
 * 
 * http://developers.app.net/docs/resources/user/#images
 */
@interface ADNImage : ADNModel

@property (nonatomic, assign) NSUInteger height;
@property (nonatomic, assign) NSUInteger width;
@property (nonatomic, copy)   NSURL *url;
@property (nonatomic, assign) BOOL isDefault;

@end
