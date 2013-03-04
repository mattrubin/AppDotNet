//
//  ADNFile.m
//  AppDotNet
//
//  Created by Matt Rubin on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNFile.h"


@implementation ADNFile

#pragma mark Keys

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [super.JSONKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"derivedFiles": ADNFieldDerivedFiles,
            @"fileToken": ADNFieldFileToken,
            @"fileId": ADNFieldId,
            @"mimeType": ADNFieldMIMEType,
            @"totalSize": ADNFieldTotalSize,
            @"urlExpires": ADNFieldURLExpires,
            @"public": ADNFieldPublic,
            @"permanentURL": ADNFieldURLPermanent
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

+ (NSValueTransformer *)derivedFilesJSONTransformer
{
    return [ADNDerivedFile transformerForDictionaryOfClass];
}

@end
