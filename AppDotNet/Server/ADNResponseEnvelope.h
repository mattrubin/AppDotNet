//
//  ADNResponseEnvelope.h
//  AppDotNet
//
//  Created by Matt Rubin on 1/19/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"
#import "ADNMetadata.h"


extern NSString * const ADNResponseEnvelopeKey;


@interface ADNResponseEnvelope : ADNModel

@property (nonatomic, readonly, strong) ADNMetadata *meta;
@property (nonatomic, readonly, strong) id data;

@end
