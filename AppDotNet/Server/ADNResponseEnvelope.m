//
//  ADNResponseEnvelope.m
//  AppDotNet
//
//  Created by Me on 1/19/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNResponseEnvelope.h"


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


#pragma mark Accessors

- (NSDictionary *)meta
{
    return [self.rawDictionary objectForKey:@"meta"];
}

- (NSDictionary *)data
{
    return [self.rawDictionary objectForKey:@"data"];
}

@end
