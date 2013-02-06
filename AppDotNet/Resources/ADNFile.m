//
//  ADNFile.m
//  AppDotNet
//
//  Created by Me on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNFile.h"


@implementation ADNFile

#pragma mark Keys

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"derivedFiles": @"derived_files",
            @"fileToken": @"file_token",
            @"fileId": @"id",
            @"mimeType": @"mime_type",
            @"totalSize": @"total_size",
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

+ (NSValueTransformer *)derivedFilesTransformer
{
    return [ADNDerivedFile transformerForDictionaryOfClass];
}

@end
