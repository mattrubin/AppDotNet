//
//  ADNMetadata.h
//  AppDotNet
//
//  Created by Me on 1/19/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ADNMetadata : NSObject

@property (nonatomic, strong) NSDictionary *rawDictionary;

- (id)initWithDictionary:(NSDictionary *)metaDictionary;
+ (instancetype)metadataWithDictionary:(NSDictionary *)metaDictionary;

@property (nonatomic, readonly, assign) NSUInteger code;

@property (nonatomic, readonly, copy) NSString *errorId;
@property (nonatomic, readonly, copy) NSString *errorSlug;
@property (nonatomic, readonly, copy) NSString *errorMessage;

@end
