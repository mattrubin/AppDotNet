//
//  ADNModel.h
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "NSValueTransformer+AppDotNet.h"


/**
 * This is the prototype model class which all AppDotNet models subclass.
 * It is a subclass of Mantle's MTLModel with a few additions:
 *
 * - Self-transformers which produce a model or collection of models
 * - Defaul transformers for properties which are ADNModel objects
 * - Runtime property assignment type checking
 */
@interface ADNModel : MTLModel <MTLJSONSerializing>

// Returns a transformer which tranforms between:
//  - a dictionary representation
//  - an instance of the target class
+ (NSValueTransformer *)transformerForClass;

// Returns a transformer which tranforms between:
//  - an array of dictionary representations
//  - an array of instances of the target class
+ (NSValueTransformer *)transformerForArrayOfClass;

// Returns a transformer which tranforms between:
//  - an array of dictionary representations
//  - a mutable array of instances of the target class
+ (NSValueTransformer *)transformerForMutableArrayOfClass;

// Returns a transformer which tranforms between:
//  - a dictionary of dictionary representations
//  - a dictionary of instances of the target class
+ (NSValueTransformer *)transformerForDictionaryOfClass;

@end
