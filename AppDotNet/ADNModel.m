//
//  ADNModel.m
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"
#import <objc/runtime.h>


@implementation ADNModel

#pragma mark Self-transformers
// These class methods return transformers which produce a model or collection of models
// of the ADNModel subclass on which the method is called.

+ (NSValueTransformer *)transformerForClass
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:self.class];
}

+ (NSValueTransformer *)transformerForArrayOfClass
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:self.class];
}

+ (NSValueTransformer *)transformerForMutableArrayOfClass
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSArray *externalArray) {
        NSMutableArray *internalArray = [NSMutableArray arrayWithCapacity:externalArray.count];
        for (NSDictionary *externalObject in externalArray) {
            [internalArray addObject:[MTLJSONAdapter modelOfClass:self.class fromJSONDictionary:externalObject error:nil]];
        }
        return internalArray;
    } reverseBlock:^(NSArray *models) {
        return [models mtl_mapUsingBlock:^(MTLModel <MTLJSONSerializing> *model) {
            return [MTLJSONAdapter JSONDictionaryFromModel:model];
        }];
    }];
}

+ (NSValueTransformer *)transformerForDictionaryOfClass
{
    NSValueTransformer *individualTransformer = [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:self.class];
    
    return [MTLValueTransformer
            reversibleTransformerWithForwardBlock:^(NSDictionary *representations) {
                return [representations mtl_mapValuesUsingBlock:^id(id key, id value) {
                    return [individualTransformer transformedValue:value];
                }];
            }
            reverseBlock:^(NSDictionary *models) {
                return [models mtl_mapValuesUsingBlock:^id(id key, id value) {
                    MTLModel <MTLJSONSerializing> *model = value;
                    return [MTLJSONAdapter JSONDictionaryFromModel:model];
                }];
            }];
}

// If a transformer is not specified for the given key, and the expected class
// of the property can supply its own transformer, use that self-transformer.
+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    NSValueTransformer *transformer = nil;
	Class propertyClass = [self propertyClassForKey:key];
	if ([propertyClass respondsToSelector:@selector(transformerForClass)]) {
		transformer = [propertyClass transformerForClass];
	}
	return transformer;
}

// Runtime property assignment type checking
// If the object being set for a key is not of the type expected by that property, an exception is raised.
// This is used to recognize improper Mantle conversion from dictionary to model object.
- (void)setValue:(id)value forKey:(NSString *)key
{
    Class class = [[self class] propertyClassForKey:key];
    if (class && ![value isKindOfClass:class]) {
        [NSException raise:@"InvalidPropertyAssignment" format:@"Trying to assign an object of type %@ to a property of type %@ (%@.%@)", [value class], class, [self class], key];
    }

    [super setValue:value forKey:key];
}

// Returns the expected class of the property specified by the given key
+ (Class)propertyClassForKey:(NSString *)key
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
	return @{};
}

@end
