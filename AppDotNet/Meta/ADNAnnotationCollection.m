//
//  ADNAnnotationCollection.m
//  AppDotNet
//
//  Created by Me on 12/25/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNAnnotationCollection.h"
#import "ADNGeolocation.h"


@interface ADNAnnotationCollection ()

@property(nonatomic, strong) NSMutableArray *annotations;

@end


@implementation ADNAnnotationCollection

- (id)init
{
    self = [super init];
    if (self) {
        self.annotations = [NSMutableArray new];
    }
    return self;
}

- (NSString *)description
{
    return self.annotations.description;
}

+ (id)instanceFromArray:(NSArray *)array
{
    ADNAnnotationCollection *instance = [[self alloc] init];
    [instance addAnnotationsFromArray:array];
    return instance;
}

- (void)addAnnotationsFromArray:(NSArray *)array
{
    if (!self.annotations) {
        self.annotations = [NSMutableArray arrayWithCapacity:array.count];
    }
    
    for (id arrayItem in array) {
        if ([arrayItem isKindOfClass:[NSDictionary class]]) {
            ADNAnnotation *newAnnotation;
            NSString *newType = [arrayItem objectForKey: ADNFieldType];
			NSError *error = nil;
			
            if ([newType isEqualToString:ADNAnnotationTypeGeolocation]) {
				newAnnotation = [ADNGeolocation modelWithDictionary:arrayItem error:&error];
            } else {
                newAnnotation = [ADNAnnotation modelWithDictionary:arrayItem error:&error];
            }
            
			if (newAnnotation && !error) {
				[self.annotations addObject:newAnnotation];
			} else {
				// TODO: might be a good idea to bubble this up
				NSLog(@"Error loading annotation from dictionary %@: %@", arrayItem, error);
			}
        }
    }
}

- (NSArray *)toArray
{
    NSMutableArray *outArray = [NSMutableArray arrayWithCapacity:self.annotations.count];
    for (ADNAnnotation *annotation in self.annotations) {
        [outArray addObject:annotation.dictionaryValue];
    }
    return outArray;
}

#pragma mark Fast Enumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len
{
    return [self.annotations countByEnumeratingWithState:state objects:buffer count:len];
}

#pragma mark Annotations

- (void)addAnnotation:(ADNAnnotation *)annotation
{
    [self.annotations addObject:annotation];
}

- (ADNAnnotation *)annotationWithType:(NSString *)type
{
    for (ADNAnnotation *annotation in self.annotations) {
        if ([annotation.type isEqualToString:type]) {
            return annotation;
        }
    }
    return nil;
}


#pragma mark Transformer

+ (NSValueTransformer *)transformerForClass
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSArray *annotations) {
        return [self instanceFromArray:annotations];
    } reverseBlock:^id(ADNAnnotationCollection *annotations) {
        return annotations.toArray;
    }];
}


@end
