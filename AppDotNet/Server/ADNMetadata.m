//
//  ADNMetadata.m
//  AppDotNet
//
//  Created by Me on 1/19/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNMetadata.h"


NSString * const ADNMetadataCodeKey         = @"code";
NSString * const ADNMetadataErrorIdKey      = @"error_id";
NSString * const ADNMetadataErrorSlugKey    = @"error_slug";
NSString * const ADNMetadataErrorMessageKey = @"error_message";


@implementation ADNMetadata

- (id)initWithDictionary:(NSDictionary *)metaDictionary
{
    self = [super init];
    if (self) {
        self.rawDictionary = metaDictionary;
    }
    return self;
}

+ (instancetype)metadataWithDictionary:(NSDictionary *)metaDictionary
{
    return [[self alloc] initWithDictionary:metaDictionary];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@%@", [super description], [self.rawDictionary description]];
}


#pragma mark Accessors

- (NSUInteger)code
{
    return [[self.rawDictionary objectForKey:ADNMetadataCodeKey] unsignedIntegerValue];
}

- (NSString *)errorId
{
    return [self.rawDictionary objectForKey:ADNMetadataErrorIdKey];
}

- (NSString *)errorSlug
{
    return [self.rawDictionary objectForKey:ADNMetadataErrorSlugKey];
}

- (NSString *)errorMessage
{
    return [self.rawDictionary objectForKey:ADNMetadataErrorMessageKey];
}

@end
