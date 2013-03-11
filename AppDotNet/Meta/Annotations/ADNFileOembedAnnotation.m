//
//  ADNFileOembedAnnotation.m
//  AppDotNet
//
//  Created by Thomas Westfeld on 07.03.13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNFileOembedAnnotation.h"

NSString * const ADNAnnotationTypeOembed = @"net.app.core.oembed";
NSString * const ADNAnnotationTypeFile = @"+net.app.core.file";

@implementation ADNFileOembedAnnotation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [super.JSONKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            ADNFieldFileToken: [NSNull null],
            ADNFieldFileId: [NSNull null],
            ADNFieldFormat: [NSNull null],
            }];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.type = ADNAnnotationTypeOembed;
    }
    return self;
}

// When building from a dictionary, intercept the "value" key
- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString: ADNFieldValue]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            [self setValue:value];
        }
    } else {
        [super setValue:value forKey:key];
    }
}

// When converting to a dictionary, intercept the "value" key
- (id)valueForKey:(NSString *)key
{
    if ([key isEqualToString: ADNFieldValue]) {
        return [self value];
    } else {
        return [super valueForKey:key];
    }
}

- (NSDictionary *)value
{
    return [self dictionaryWithValuesForKeys:@[ADNFieldFileToken, ADNFieldFileId, ADNFieldFormat]];
}

- (void)setValue:(NSDictionary *)value
{
    [self setValuesForKeysWithDictionary:value];
}

// Don't allow the type to change
- (void)setType:(NSString *)type
{
    if ([type isEqualToString:ADNAnnotationTypeOembed]) {
        [super setType:ADNAnnotationTypeOembed];
    } else {
        NSLog(@"%@ has a fixed type of %@", self.class, ADNAnnotationTypeOembed);
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:ADNFieldFileToken]) {
        [self setValue:value forKey:ADNFieldFileToken];
    } else if ([key isEqualToString:ADNFieldFileId]) {
        [self setValue:value forKey:ADNFieldFileId];
    } else if ([key isEqualToString:ADNFieldFormat]) {
        [self setValue:value forKey:ADNFieldFormat];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (id)valueForUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:ADNFieldFileToken]) {
        return [self valueForKey:ADNFieldFileToken];
    } else if ([key isEqualToString:ADNFieldFileId]) {
        return [self valueForKey:ADNFieldFileId];
    } else if ([key isEqualToString:ADNFieldFormat]) {
        return [self valueForKey:ADNFieldFormat];
    } else {
        return [super valueForUndefinedKey:key];
    }
}

#pragma mark -

+ (id)instanceFromFile:(ADNFile *)file
{
    ADNFileOembedAnnotation *instance = [[self alloc] init];
    instance.file = file;
    return instance;
}
@end
