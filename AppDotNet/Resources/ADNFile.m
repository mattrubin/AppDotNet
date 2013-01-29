//
//  ADNFile.m
//  AppDotNet
//
//  Created by Me on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNFile.h"
#import "ADNHelper.h"


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
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *urlString) {
        return [NSURL URLWithString:urlString];
    } reverseBlock:^id(NSURL *url) {
        return url.absoluteString;
    }];
}

+ (NSValueTransformer *)urlExpiresTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *dateString) {
        return [[ADNHelper dateFormatter] dateFromString:dateString];
    } reverseBlock:^id(NSDate *date) {
        return [[ADNHelper dateFormatter] stringFromDate:date];
    }];
}

@end
