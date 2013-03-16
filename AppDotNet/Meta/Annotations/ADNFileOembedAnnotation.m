//
//  ADNFileOembedAnnotation.m
//  AppDotNet
//
//  Created by Thomas Westfeld on 07.03.13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNFileOembedAnnotation.h"
#import "ADNFile.h"

NSString * const ADNAnnotationTypeOembed = @"net.app.core.oembed";
NSString * const ADNAnnotationTypeFile = @"+net.app.core.file";

@implementation ADNFileOembedAnnotation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [super.JSONKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"file": [NSNull null] // do not serialize file property to JSON
            }];
}


- (id)init
{
    self = [super init];
    if (self) {
        self.type = ADNAnnotationTypeOembed;
    }
    return self;
}

+ (id)instanceFromFile:(ADNFile *)file
{
    ADNFileOembedAnnotation *instance = [[self alloc] init];
    instance.file = file;
    return instance;
}

- (NSDictionary *)value
{
    return @{ ADNAnnotationTypeFile : @{ADNFieldFileId: self.file.fileId,
                                        ADNFieldFileToken: self.file.fileToken,
                                        ADNFieldFormat: @"oembed"
                                        }};
}

// Don't allow the type to change
- (void)setType:(NSString *)type
{
    if ([type isEqualToString:ADNAnnotationTypeOembed]) {
        [super setType:ADNAnnotationTypeOembed];
    } else {
        NSLog(@"%@ has a fixed type of %@", self.class, ADNAnnotationTypeOembed);
    }
}

@end
