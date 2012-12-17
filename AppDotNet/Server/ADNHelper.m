//
//  ADNHelper.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNHelper.h"

#import "NSDictionary+ADN.h"


@implementation ADNHelper

+ (NSDictionary*)dictionaryFromJSONData:(NSData *)data
{
    NSError *error;
    id JSONObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (!error) {
        if ([JSONObject isKindOfClass:[NSDictionary class]]) {
            return (NSDictionary*)JSONObject;
        } else {
            NSLog(@"Error: JSON object is not a dictionary");
            return nil;
        }
    } else {
        NSLog(@"ERROR: %@", error);
        return nil;
    }
}

+ (NSDictionary*)responseDataFromEnvelope:(NSDictionary *)responseEnvelope
{
    NSDictionary *meta = [responseEnvelope dictionaryForKey:@"meta"];
    NSInteger code = [meta integerForKey:@"code"];
    
    if (code == 200) {
        return [responseEnvelope dictionaryForKey:@"data"];
    } else {
        NSString * errorMessage = [meta stringForKey:@"error_message"];
        NSLog(@"Error %i: %@", code, errorMessage);
        return nil;
    }

}

+ (NSDateFormatter*)dateFormatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    dateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    return dateFormatter;
}

@end
