//
//  ADNAnnotationCollection.h
//  AppDotNet
//
//  Created by Me on 12/25/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADNAnnotation.h"


@interface ADNAnnotationCollection : NSObject <NSFastEnumeration>

+ (id)instanceFromArray:(NSArray *)array;
- (void)addAnnotationsFromArray:(NSArray *)array;

- (NSArray *)toArray;

//- (ADNAnnotation *)annotationWithType:(NSString *)type;
//- (void)setAnnotation:(id)value withType:(NSString *)type;

@end
