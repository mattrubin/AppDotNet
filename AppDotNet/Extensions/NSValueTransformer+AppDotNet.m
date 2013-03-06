//
//  NSValueTransformer+AppDotNet.m
//  AppDotNet
//
//  Created by Matt Rubin on 2/6/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NSValueTransformer+AppDotNet.h"
#import "ADNGeolocation.h"
#import "ADNHelper.h"
#import <Mantle/Mantle.h>


NSString * const ADNDateValueTransformerName = @"ADNDateValueTransformerName";
NSString * const ADNAnnotationArrayValueTransformerName = @"ADNAnnotationArrayValueTransformerName";

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
        
        
        MTLValueTransformer *annotationArrayTransformer = [MTLValueTransformer
            reversibleTransformerWithForwardBlock:^id(NSArray *dictionaries) {
                if (dictionaries == nil) return nil;
                
                NSAssert([dictionaries isKindOfClass:NSArray.class], @"Expected a array of dictionaries, got: %@", dictionaries);
                
                NSMutableArray *annotations = [NSMutableArray arrayWithCapacity:dictionaries.count];
                for (NSDictionary *dictionary in dictionaries) {
                    NSString *type = [dictionary objectForKey:ADNFieldType];
                    NSValueTransformer *transformer = nil;
                    if ([type isEqualToString:ADNAnnotationTypeGeolocation]) {
                        transformer = [self mtl_JSONDictionaryTransformerWithModelClass:[ADNGeolocation class]];
                    } else {
                        transformer = [self mtl_JSONDictionaryTransformerWithModelClass:[ADNAnnotation class]];
                    }
                    ADNAnnotation *annotation = [transformer transformedValue:dictionary];
                    if (annotation == nil) continue;

                    [annotations addObject:annotation];
                }
                return annotations;
            }
            reverseBlock:^id(NSArray *annotations) {
                if (annotations == nil) return nil;
                
                NSAssert([annotations isKindOfClass:NSArray.class], @"Expected a array of ADNAnnotations, got: %@", annotations);
                
                NSMutableArray *dictionaries = [NSMutableArray arrayWithCapacity:annotations.count];
                for (ADNAnnotation *annotation in annotations) {
                    [dictionaries addObject:[MTLJSONAdapter JSONDictionaryFromModel:annotation]];
                }
                return dictionaries;
            }];
        
        [NSValueTransformer setValueTransformer:annotationArrayTransformer forName:ADNAnnotationArrayValueTransformerName];
	}
}

@end
