//
//  ADNAnnotation.h
//  AppDotNet
//
//  Created by Me on 12/17/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADNAnnotation : NSObject

@property NSString *type;
@property NSDictionary *value;


#pragma mark Methods

- (id)initWithDictionary:(NSDictionary*)dictionary;
+ (id)annotationFromDictionary:(NSDictionary*)dictionary;

- (void)updateWithDictionary:(NSDictionary*)dictionary;

@end
