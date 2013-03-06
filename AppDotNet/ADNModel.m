//
//  ADNModel.m
//  AppDotNet
//
//  Created by Matt Rubin on 1/21/13.
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
    NSValueTransformer *individualTransformer = [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:self.class];
    
    return [MTLValueTransformer
            reversibleTransformerWithForwardBlock:^id(NSArray *representations) {
                NSMutableArray *models = [NSMutableArray arrayWithCapacity:representations.count];
                for (id representation in representations) {
                    id model = [individualTransformer transformedValue:representation];
                    if (model) {
                        [models addObject:model];
                    }
                }
                return models;
            }
            reverseBlock:^id(NSArray *models) {
                NSMutableArray *representations = [NSMutableArray arrayWithCapacity:models.count];
                for (id model in models) {
                    id representation = [individualTransformer reverseTransformedValue:model];
                    if (representation) {
                        [representations addObject:representation];
                    }
                }
                return representations;
            }];
}

+ (NSValueTransformer *)transformerForDictionaryOfClass
{
    NSValueTransformer *individualTransformer = [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:self.class];
    
    return [MTLValueTransformer
            reversibleTransformerWithForwardBlock:^id(NSDictionary *representations) {
                NSMutableDictionary *models = [NSMutableDictionary dictionaryWithCapacity:representations.count];
                [representations enumerateKeysAndObjectsUsingBlock:^(id key, id representation, BOOL *stop) {
                    id model = [individualTransformer transformedValue:representation];
                    if (model) {
                        [models setObject:model forKey:key];
                    }
                }];
                return models;
            }
            reverseBlock:^id(NSDictionary *models) {
                NSMutableDictionary *representations = [NSMutableDictionary dictionaryWithCapacity:models.count];
                [models enumerateKeysAndObjectsUsingBlock:^(id key, id model, BOOL *stop) {
                    id representation = [individualTransformer reverseTransformedValue:model];
                    if (representation) {
                        [representations setObject:representation forKey:key];
                    }
                }];
                return representations;
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
