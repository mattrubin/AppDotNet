//
//  ADNAnnotation.h
//  AppDotNet
//
//  Created by Me on 12/17/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADNObject.h"


@interface ADNAnnotation : ADNObject

@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSDictionary *value;

@end
