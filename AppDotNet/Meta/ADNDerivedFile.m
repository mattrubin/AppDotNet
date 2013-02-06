//
//  ADNDerivedFile.m
//  AppDotNet
//
//  Created by Me on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNDerivedFile.h"


NSString * const ADNDerivedFileKeyImageThumb200s = @"image_thumb_200s";
NSString * const ADNDerivedFileKeyImageThumb960r = @"image_thumb_960r";


@implementation ADNDerivedFile

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"mimeType": @"mime_type",
            @"urlExpires": @"url_expires",
            }];
}


#pragma mark Transformers

+ (NSValueTransformer *)urlTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)urlExpiresTransformer
{
    return [NSValueTransformer valueTransformerForName:ADNDateValueTransformerName];
}

@end
