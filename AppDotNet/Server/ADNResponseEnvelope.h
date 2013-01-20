//
//  ADNResponseEnvelope.h
//  AppDotNet
//
//  Created by Me on 1/19/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "ADNMetadata.h"


extern NSString * const ADNResponseEnvelopeKey;


@interface ADNResponseEnvelope : MTLModel

@property (nonatomic, readonly, strong) ADNMetadata *meta;
@property (nonatomic, readonly, strong) NSDictionary *data;

@end
