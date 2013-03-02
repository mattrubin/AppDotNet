//
//  ADNAnnotation.m
//  AppDotNet
//
//  Created by Matt Rubin on 12/17/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNAnnotation.h"


@implementation ADNAnnotation

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: %@, %@]", self.class, self.type, self.value];
}

@end
