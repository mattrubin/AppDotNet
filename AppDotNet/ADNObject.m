//
//  ADNObject.m
//  AppDotNet
//
//  Created by Me on 12/19/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNObject.h"

#import <objc/runtime.h>


@interface ADNObject ()

- (Class)propertyClassForKey:(NSString *)key;

@end


@implementation ADNObject

+ (id)instanceFromDictionary:(NSDictionary *)dictionary
{
    ADNObject *instance = [[self alloc] init];
    [instance setAttributesFromDictionary:dictionary];
    return instance;
}

- (void)setAttributesFromDictionary:(NSDictionary *)dictionary
{
    if (![dictionary isKindOfClass:[NSDictionary class]])
        return;
    
    [self setValuesForKeysWithDictionary:dictionary];
}

- (NSDictionary *)toDictionary
{
    return [NSDictionary dictionary];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    Class class = [self propertyClassForKey:key];
    if (class && ![value isKindOfClass:class]) {
        [NSException raise:@"InvalidPropertyAssignment" format:@"Trying to assign an object of type %@ to a property of type %@ (%@.%@)", [value class], class, [self class], key];
    }
    [super setValue:value forKey:key];
}

- (Class)propertyClassForKey:(NSString *)key
{
    Class class = nil;
    
    objc_property_t property = class_getProperty([self class], [key UTF8String]);
    if (property) {
        // The property exists
        char *typeEncoding = property_copyAttributeValue(property, "T");
        if (typeEncoding[0] == '@' && strlen(typeEncoding) >= 3) {
            // The type is a class
            char *className = strndup(typeEncoding+2, strlen(typeEncoding)-3);
            class = NSClassFromString([NSString stringWithUTF8String:className]);
            free(className);
        }
        free(typeEncoding);
    }
    
    return class;
}

- (void)setValue:(id)value toClass:(Class)keyClass forKey:(NSString *)key
{
    if ([value isKindOfClass:[NSDictionary class]]) {
        id newValue = [keyClass instanceFromDictionary:value];
        [super setValue:newValue forKey:key];
    }
}

@end
