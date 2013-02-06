//
//  ADNDerivedFile.m
//  AppDotNet
//
//  Created by Me on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNDerivedFile.h"
#import "ADNHelper.h"


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
