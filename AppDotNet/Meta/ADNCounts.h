//
//  ADNCounts.h
//  AppDotNet
//
//  Created by Me on 12/24/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNObject.h"

@interface ADNCounts : ADNObject

@property (nonatomic, assign) NSUInteger followers;
@property (nonatomic, assign) NSUInteger following;
@property (nonatomic, assign) NSUInteger posts;
@property (nonatomic, assign) NSUInteger stars;

@end
