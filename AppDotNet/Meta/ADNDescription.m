//
//  ADNDescription.m
//  AppDotNet
//
//  Created by Me on 12/24/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNDescription.h"


@implementation ADNDescription

+ (NSValueTransformer *)entitiesTransformer
{
    return [ADNEntities transformerForClass];
}

@end
