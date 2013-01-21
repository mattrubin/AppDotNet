//
//  ADNDescription.h
//  AppDotNet
//
//  Created by Me on 12/24/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"
#import "ADNEntities.h"


@interface ADNDescription : ADNModel

@property (nonatomic, strong) ADNEntities *entities;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *text;

@end
