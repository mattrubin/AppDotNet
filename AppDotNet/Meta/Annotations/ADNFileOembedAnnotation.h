//
//  ADNFileOembedAnnotation.h
//  AppDotNet
//
//  Created by Thomas Westfeld on 07.03.13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNAnnotation.h"

@class ADNFile;

extern NSString * const ADNAnnotationTypeOembed;

@interface ADNFileOembedAnnotation : ADNAnnotation


@property (nonatomic, strong) ADNFile *file;

@end
