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

/*
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization
    }
    return self;
}
*/

- (id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [self init];
    if (self) {
        [self updateWithDictionary:dictionary];
    }
    return self;
}

+ (id)annotationFromDictionary:(NSDictionary*)dictionary
{
    return [[ADNAnnotation alloc] initWithDictionary:dictionary];
}

- (void)updateWithDictionary:(NSDictionary*)dictionary
{
    self.type  = [dictionary stringForKey:ANNOTATION_KEY_TYPE];
    self.value = [dictionary dictionaryForKey:ANNOTATION_KEY_VALUE];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: %@, %@]", self.class, self.type, self.value];
}

@end
