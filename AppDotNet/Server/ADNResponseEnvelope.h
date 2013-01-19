//
//  ADNResponseEnvelope.h
//  AppDotNet
//
//  Created by Me on 1/19/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString * const ADNResponseEnvelopeKey;
extern NSString * const ADNResponseEnvelopeMetaKey;
extern NSString * const ADNResponseEnvelopeDataKey;


@class ADNMetadata;


@interface ADNResponseEnvelope : NSObject

@property (nonatomic, strong) NSDictionary *rawDictionary;
@property (nonatomic, strong, readonly) ADNMetadata *meta;
@property (nonatomic, readonly) NSDictionary *data;


- (id)initWithDictionary:(NSDictionary *)responseDictionary;
+ (instancetype)responseEnvelopeWithDictionary:(NSDictionary *)responseDictionary;

@end
