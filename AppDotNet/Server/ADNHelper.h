//
//  ADNHelper.h
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADNHelper : NSObject

+ (NSDictionary*)dictionaryFromJSONData:(NSData*)data;

+ (NSDictionary*)responseDataFromEnvelope:(NSDictionary*)responseEnvelope;

+ (NSDateFormatter*)dateFormatter;

@end
