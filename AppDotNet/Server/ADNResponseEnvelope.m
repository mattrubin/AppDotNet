//
//  ADNResponseEnvelope.m
//  AppDotNet
//
//  Created by Me on 1/19/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNResponseEnvelope.h"
#import "ADNMetadata.h"


NSString * const ADNResponseEnvelopeKey     = @"ADNResponseEnvelope";
NSString * const ADNResponseEnvelopeMetaKey = @"meta";
NSString * const ADNResponseEnvelopeDataKey = @"data";


@interface ADNResponseEnvelope ()

@property (nonatomic, strong) ADNMetadata *meta;

@end


@implementation ADNResponseEnvelope

- (id)initWithDictionary:(NSDictionary *)responseDictionary
{
    self = [super init];
    if (self) {
        self.rawDictionary = responseDictionary;
    }
    return self;
}

+ (instancetype)responseEnvelopeWithDictionary:(NSDictionary *)responseDictionary
{
    return [[self alloc] initWithDictionary:responseDictionary];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@%@", [super description], [self.rawDictionary description]];
}

#pragma mark Accessors

- (void)setRawDictionary:(NSDictionary *)rawDictionary
{
    _rawDictionary = rawDictionary;
    
    NSDictionary *metaDictionary = [self.rawDictionary objectForKey:ADNResponseEnvelopeMetaKey];
    self.meta = [ADNMetadata modelWithExternalRepresentation:metaDictionary];
}

- (NSDictionary *)data
{
    return [self.rawDictionary objectForKey:ADNResponseEnvelopeDataKey];
}

@end
