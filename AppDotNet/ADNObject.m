//
//  ADNObject.m
//  AppDotNet
//
//  Created by Me on 12/19/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNObject.h"

#import <objc/runtime.h>


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
    objc_property_t theProperty = class_getProperty([self class], [key UTF8String]);
    
    if (theProperty) {
        char *typeEncoding = property_copyAttributeValue(theProperty, "T");
        Class class = nil;
        
        if (typeEncoding[0] == '@') {
            // Object
            if (strlen(typeEncoding) >= 3) {
                char *className = strndup(typeEncoding+2, strlen(typeEncoding)-3);
                class = NSClassFromString([NSString stringWithUTF8String:className]);
            }
            
            if (class && ![value isKindOfClass:class]) {
                [NSException raise:@"InvalidPropertyAssignment" format:@"Trying to assign an object of type %@ to a property of type %@ (%@.%@)", [value class], class, [self class], key];
            }
        }
        free(typeEncoding);
    }
    [super setValue:value forKey:key];
}

@end
