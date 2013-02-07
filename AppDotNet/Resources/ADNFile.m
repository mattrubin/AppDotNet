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
            @"derivedFiles": ADNFieldDerivedFiles,
            @"fileToken": ADNFieldFileToken,
            @"fileId": ADNFieldId,
            @"mimeType": ADNFieldMIMEType,
            @"totalSize": ADNFieldTotalSize,
            @"urlExpires": ADNFieldURLExpires,
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
