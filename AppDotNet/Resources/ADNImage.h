//
//  ADNImage.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ADNImage : NSObject

@property NSUInteger height;
@property NSUInteger width;
@property NSString *url;


#pragma mark Methods

- (id)initWithDictionary:(NSDictionary*)dictionary;
+ (id)imageWithDictionary:(NSDictionary*)dictionary;

- (void)updateWithDictionary:(NSDictionary*)dictionary;

@end
