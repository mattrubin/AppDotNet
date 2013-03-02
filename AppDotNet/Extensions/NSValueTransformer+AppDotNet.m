//
//  NSValueTransformer+AppDotNet.m
//  AppDotNet
//
//  Created by Matt Rubin on 2/6/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NSValueTransformer+AppDotNet.h"
#import "ADNHelper.h"
#import <Mantle/Mantle.h>


NSString * const ADNDateValueTransformerName = @"ADNDateValueTransformerName";


@implementation NSValueTransformer (AppDotNet)

#pragma mark Category Loading

+ (void)load {
	@autoreleasepool {
		MTLValueTransformer *dateValueTransformer = [MTLValueTransformer
            reversibleTransformerWithForwardBlock:^id(NSString *dateString) {
                return [[ADNHelper dateFormatter] dateFromString:dateString];
            } reverseBlock:^id(NSDate *date) {
                return [[ADNHelper dateFormatter] stringFromDate:date];
            }];
        
		[NSValueTransformer setValueTransformer:dateValueTransformer forName:ADNDateValueTransformerName];
	}
}

@end
