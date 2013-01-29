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

// Self-transformer
+ (NSValueTransformer *)transformerForClass
{
    return [NSValueTransformer mtl_externalRepresentationTransformerWithModelClass:self.class];
}

+ (NSValueTransformer *)transformerForArrayOfClass
{
    return [NSValueTransformer mtl_externalRepresentationArrayTransformerWithModelClass:self.class];
}

+ (NSValueTransformer *)transformerForMutableArrayOfClass
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSArray *externalArray) {
        NSMutableArray *internalArray = [NSMutableArray arrayWithCapacity:externalArray.count];
        for (NSDictionary *externalObject in externalArray) {
            [internalArray addObject:[self modelWithExternalRepresentation:externalObject]];
        }
        return internalArray;
    } reverseBlock:^(NSArray *models) {
        return [models mtl_mapUsingBlock:^(MTLModel *model) {
            return model.externalRepresentation;
        }];
    }];
}

+ (NSValueTransformer *)transformerForDictionaryOfClass
{
    NSValueTransformer *individualTransformer = [NSValueTransformer mtl_externalRepresentationTransformerWithModelClass:self.class];
    
    return [MTLValueTransformer
            reversibleTransformerWithForwardBlock:^(NSDictionary *representations) {
                return [representations mtl_mapValuesUsingBlock:^id(id key, id value) {
                    return [individualTransformer transformedValue:value];
                }];
            }
            reverseBlock:^(NSDictionary *models) {
                return [models mtl_mapValuesUsingBlock:^id(id key, id value) {
                    MTLModel *model = value;
                    return model.externalRepresentation;
                }];
            }];
}

+ (NSValueTransformer *)transformerForKey:(NSString *)key {
    NSValueTransformer *transformer = [super transformerForKey:key];
    if (!transformer) {
        Class propertyClass = [self propertyClassForKey:key];
        if ([propertyClass respondsToSelector:@selector(transformerForClass)]) {
            transformer = [propertyClass transformerForClass];
        }
    }
	return transformer;
}


- (void)setValue:(id)value forKey:(NSString *)key
{
    Class class = [[self class] propertyClassForKey:key];
    if (class && ![value isKindOfClass:class]) {
        [NSException raise:@"InvalidPropertyAssignment" format:@"Trying to assign an object of type %@ to a property of type %@ (%@.%@)", [value class], class, [self class], key];
    }

    [super setValue:value forKey:key];
}

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


@end
