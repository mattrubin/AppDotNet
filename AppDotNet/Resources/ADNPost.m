//
//  ADNPost.m
//  AppDotNet
//
//  Created by Me on 12/14/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNPost.h"


@implementation ADNPost

- (id)init
{
    self = [super init];
    if (self) {
        self.annotations = [ADNAnnotationCollection new];
    }
    return self;
}

@end
