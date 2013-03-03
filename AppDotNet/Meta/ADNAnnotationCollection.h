//
//  ADNAnnotationCollection.h
//  AppDotNet
//
//  Created by Matt Rubin on 12/25/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNAnnotation.h"


/**
 * Annotations are metadata that can be attached to Users, Posts, Channels, or
 * Messages. This allows developers and users to add extra information to
 * App.net objects outside of the fields App.net has already defined.
 *
 * http://developers.app.net/docs/meta/annotations
 */
@interface ADNAnnotationCollection : NSObject <NSFastEnumeration>

+ (id)instanceFromArray:(NSArray *)array;
- (void)addAnnotationsFromArray:(NSArray *)array;

- (NSArray *)toArray;

- (ADNAnnotation *)annotationWithType:(NSString *)type;
- (void)addAnnotation:(ADNAnnotation *)annotation;

+ (NSValueTransformer *)transformerForClass;

@end
