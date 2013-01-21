//
//  ADNAnnotation.h
//  AppDotNet
//
//  Created by Me on 12/17/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"


@interface ADNAnnotation : ADNModel

@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSDictionary *value;

@end
