//
//  ADNHelper.h
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADNHelper : NSObject

+ (NSDictionary*)dictionaryFromJSONData:(NSData*)data error:(NSError **)error;
+ (NSData*)JSONDataFromDictionary:(NSDictionary*)dictionary;

+ (id)responseContentFromEnvelope:(NSDictionary*)responseEnvelope error:(NSError **)error;

+ (NSDateFormatter*)dateFormatter;

@end
