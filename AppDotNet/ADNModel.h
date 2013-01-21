//
//  ADNModel.h
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface ADNModel : MTLModel

+ (NSValueTransformer *)transformerForClass;
+ (NSValueTransformer *)transformerForArrayOfClass;

@end
