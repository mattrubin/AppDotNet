//
//  ADNDerivedFile.m
//  AppDotNet
//
//  Created by Matt Rubin on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNDerivedFile.h"


NSString * const ADNDerivedFileKeyImageThumb200s = @"image_thumb_200s";
NSString * const ADNDerivedFileKeyImageThumb960r = @"image_thumb_960r";


@implementation ADNDerivedFile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [super.JSONKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"mimeType": ADNFieldMIMEType,
            @"urlExpires": ADNFieldURLExpires,
            }];
}


#pragma mark Transformers

+ (NSValueTransformer *)urlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)urlExpiresJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:ADNDateValueTransformerName];
}

@end
