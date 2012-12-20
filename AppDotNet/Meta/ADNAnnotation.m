//
//  ADNAnnotation.m
//  AppDotNet
//
//  Created by Me on 12/17/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNAnnotation.h"

#import "NSDictionary+ADN.h"


#define ANNOTATION_KEY_TYPE     @"type"
#define ANNOTATION_KEY_VALUE    @"value"


@implementation ADNAnnotation

- (void)setAttributesFromDictionary:(NSDictionary *)dictionary
{
    self.type  = [dictionary stringForKey:ANNOTATION_KEY_TYPE];
    self.value = [dictionary dictionaryForKey:ANNOTATION_KEY_VALUE];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: %@, %@]", self.class, self.type, self.value];
}


- (NSDictionary *)toDictionary
{
    NSMutableDictionary *dictionary = [NSDictionary dictionary];
    
    if (self.type)
        [dictionary setObject:self.type forKey:ANNOTATION_KEY_TYPE];
    if (self.value)
        [dictionary setObject:self.value forKey:ANNOTATION_KEY_VALUE];
    
    return dictionary;
}

@end
