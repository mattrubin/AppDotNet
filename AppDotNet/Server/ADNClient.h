//
//  ADNClient.h
//  AppDotNet
//
//  Created by Me on 1/17/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "AFHTTPClient.h"
#import "ADNHandlers.h"


@interface ADNClient : AFHTTPClient

+ (instancetype)sharedClient;

@property (nonatomic, copy) NSString *accessToken;

@property (nonatomic, assign) BOOL prettyJSON;

// Default blocks
- (void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlockForHandler:(GenericCompletionHandler)handler;
- (void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlockForModelOfClass:(Class)modelClass withHandler:(GenericCompletionHandler)handler;
- (void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlockForArrayofModelsOfClass:(Class)modelClass withHandler:(GenericCompletionHandler)handler;
- (void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlockForHandler:(GenericCompletionHandler)handler;

@end
