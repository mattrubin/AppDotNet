//
//  ADNMetadata.m
//  AppDotNet
//
//  Created by Me on 1/19/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNMetadata.h"


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

@end
