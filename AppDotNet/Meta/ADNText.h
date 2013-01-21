//
//  ADNText.h
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"
#import "ADNEntities.h"


@interface ADNText : ADNModel

@property (nonatomic, strong) ADNEntities *entities;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *text;

@end
