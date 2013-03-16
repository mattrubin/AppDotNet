//
//  ADNFileOembedAnnotation.h
//  AppDotNet
//
//  Created by Thomas Westfeld on 07.03.13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

/**
 * A subclass of ADNAnnotation with properties to support the oembed annotation.
 * This model is for creating the annotation only as it takes the replacement
 * parameter of the ADN file:
 * https://github.com/appdotnet/object-metadata/blob/master/annotation-replacement-values/+net.app.core.file.md#oembed-format
 */
 
#import "ADNAnnotation.h"

@class ADNFile;

extern NSString * const ADNAnnotationTypeOembed;

@interface ADNFileOembedAnnotation : ADNAnnotation


@property (nonatomic, strong) ADNFile *file;


// convinience constructor
+ (id)instanceFromFile:(ADNFile *)file;

@end
