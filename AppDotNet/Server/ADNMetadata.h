//
//  ADNMetadata.h
//  AppDotNet
//
//  Created by Me on 1/19/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString * const ADNErrorInvalidToken;
extern NSString * const ADNErrorNotAuthorized;
extern NSString * const ADNErrorTokenExpired;
extern NSString * const ADNErrorCodeUsed;
extern NSString * const ADNErrorRedirectURIRequired;


@interface ADNMetadata : NSObject

@property (nonatomic, strong) NSDictionary *rawDictionary;

- (id)initWithDictionary:(NSDictionary *)metaDictionary;
+ (instancetype)metadataWithDictionary:(NSDictionary *)metaDictionary;

@property (nonatomic, readonly, assign) NSUInteger code;

@property (nonatomic, readonly, copy) NSString *errorId;
@property (nonatomic, readonly, copy) NSString *errorSlug;
@property (nonatomic, readonly, copy) NSString *errorMessage;

@end
