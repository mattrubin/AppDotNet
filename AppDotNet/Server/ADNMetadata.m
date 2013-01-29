//
//  ADNMetadata.m
//  AppDotNet
//
//  Created by Me on 1/19/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNMetadata.h"


NSString * const ADNMetadataCodeKey         = @"code";
// Error Keys
NSString * const ADNMetadataErrorIdKey      = @"error_id";
NSString * const ADNMetadataErrorSlugKey    = @"error_slug";
NSString * const ADNMetadataErrorMessageKey = @"error_message";
// Pagination Keys
NSString * const ADNMetadataMaxIdKey        = @"max_id";
NSString * const ADNMetadataMinIdKey        = @"min_id";
NSString * const ADNMetadataMoreKey         = @"more";

// Error Slugs
NSString * const ADNErrorInvalidToken        = @"invalid-token";
NSString * const ADNErrorNotAuthorized       = @"not-authorized";
NSString * const ADNErrorTokenExpired        = @"token-expired";
NSString * const ADNErrorCodeUsed            = @"code-used";
NSString * const ADNErrorRedirectURIRequired = @"redirect-uri-required";


@implementation ADNMetadata

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"errorId": ADNMetadataErrorIdKey,
            @"errorMessage": ADNMetadataErrorMessageKey,
            @"errorSlug": ADNMetadataErrorSlugKey,
            @"maxId": ADNMetadataMaxIdKey,
            @"maxId": ADNMetadataMinIdKey,
            }];
}


#pragma mark Transformers

+ (NSValueTransformer *)maxIdTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(id rawId) {
        if ([rawId isKindOfClass:[NSString class]]) {
            return [NSString stringWithString:rawId];
        }
        if ([rawId isKindOfClass:[NSNumber class]]) {
            NSNumber *numberId = rawId;
            return [numberId stringValue];
        } else {
            return [NSString stringWithFormat:@"%@", rawId];
        }
    } reverseBlock:^id(NSString *stringId) {
        return stringId;
    }];
}

+ (NSValueTransformer *)minIdTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(id rawId) {
        if ([rawId isKindOfClass:[NSString class]]) {
            return [NSString stringWithString:rawId];
        }
        if ([rawId isKindOfClass:[NSNumber class]]) {
            NSNumber *numberId = rawId;
            return [numberId stringValue];
        } else {
            return [NSString stringWithFormat:@"%@", rawId];
        }
    } reverseBlock:^id(NSString *stringId) {
        return stringId;
    }];
}

@end
