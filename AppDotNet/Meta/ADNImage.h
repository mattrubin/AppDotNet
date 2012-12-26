//
//  ADNImage.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADNObject.h"


@interface ADNImage : ADNObject

@property (nonatomic, assign) NSUInteger height;
@property (nonatomic, assign) NSUInteger width;
@property (nonatomic, copy)   NSString *url;

@end
