//
//  ADNAnnotationCollection.m
//  AppDotNet
//
//  Created by Me on 12/25/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNAnnotationCollection.h"


@interface ADNAnnotationCollection ()

@property(nonatomic, strong) NSMutableArray *annotations;

@end


@implementation ADNAnnotationCollection

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
            [self.annotations addObject:[ADNAnnotation instanceFromDictionary:arrayItem]];
        }
    }
}

- (NSArray *)toArray
{
    NSMutableArray *outArray = [NSMutableArray arrayWithCapacity:self.annotations.count];
    for (ADNAnnotation *annotation in self.annotations) {
        [outArray addObject:annotation.toDictionary];
    }
    return outArray;
}

#pragma mark Fast Enumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len
{
    return [self.annotations countByEnumeratingWithState:state objects:buffer count:len];
}

@end
