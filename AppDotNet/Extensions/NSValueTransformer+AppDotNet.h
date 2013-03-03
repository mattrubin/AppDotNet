//
//  NSValueTransformer+AppDotNet.h
//  AppDotNet
//
//  Created by Me on 2/6/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>


// The name for a value transformer that converts ADN date strings into NSDates and back.
extern NSString * const ADNDateValueTransformerName;

// The name for a value transformer that converts arrays of annotation JSONs into
// arrays of the correct ADNAnnotation subclass and back
extern NSString * const ADNAnnotationArrayValueTransformerName;

@interface NSValueTransformer (AppDotNet)

@end
