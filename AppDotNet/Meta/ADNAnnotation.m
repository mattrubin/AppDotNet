//
//  ADNAnnotation.m
//  AppDotNet
//
//  Created by Me on 12/17/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNAnnotation.h"

#import "NSDictionary+ADN.h"


#define ANNOTATION_KEY_TYPE     @"type"
#define ANNOTATION_KEY_VALUE    @"value"


@implementation ADNAnnotation

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: %@, %@]", self.class, self.type, self.value];
}


- (NSArray *)exportKeys
{
    return @[@"type", @"value"];
}

@end
