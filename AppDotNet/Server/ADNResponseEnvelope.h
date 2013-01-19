//
//  ADNResponseEnvelope.h
//  AppDotNet
//
//  Created by Me on 1/19/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ADNResponseEnvelope : NSObject

@property (nonatomic, strong) NSDictionary *rawDictionary;
@property (nonatomic, strong) NSDictionary *meta;
@property (nonatomic, strong) NSDictionary *data;


- (id)initWithDictionary:(NSDictionary *)responseDictionary;
+ (instancetype)responseEnvelopeWithDictionary:(NSDictionary *)responseDictionary;

@end
