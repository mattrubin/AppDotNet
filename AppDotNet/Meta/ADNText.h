//
//  ADNText.h
//  AppDotNet
//
//  Created by Matt Rubin on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"
#import "ADNEntities.h"


/**
 * When a request is made to create a Post or Message, or update a User profile
 * description, the provided body text is processed for entities. The ADNText
 * class represents text returned from the text processor endpoint, and provides
 * the superclass for the ADNPost, ADNMessage, and ADNDescription classes.
 * 
 * http://developers.app.net/docs/resources/text-processor
 */
@interface ADNText : ADNModel

@property (nonatomic, strong) ADNEntities *entities;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *text;

@end
