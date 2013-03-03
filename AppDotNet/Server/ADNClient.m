//
//  ADNClient.m
//  AppDotNet
//
//  Created by Me on 1/17/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient.h"
#import "ADNJSONRequestOperation.h"
#import "ADNImageRequestOperation.h"
#import "ADNResponseEnvelope.h"


NSString * const ADNHeaderPrettyJSON = @"X-ADN-Pretty-JSON";


@implementation ADNClient

+ (instancetype)sharedClient
{
    static ADNClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ADNClient alloc] initWithBaseURL:[NSURL URLWithString:@"https://alpha-api.app.net/stream/0/"]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[ADNImageRequestOperation class]];
    [self registerHTTPOperationClass:[ADNJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (void)setAccessToken:(NSString *)accessToken
{
    _accessToken = [accessToken copy];
    
    if (_accessToken) {
        [self setDefaultHeader:@"Authorization"
                         value:[@"Bearer " stringByAppendingString:_accessToken]];
    } else {
        [self setDefaultHeader:@"Authorization"
                         value:nil];
    }
}

- (void)setPrettyJSON:(BOOL)prettyJSON
{
    _prettyJSON = prettyJSON;
    
    if (_prettyJSON) {
        [self setDefaultHeader:ADNHeaderPrettyJSON value:@"1"];
    } else {
        [self setDefaultHeader:ADNHeaderPrettyJSON value:nil];
    }
}


#pragma mark Default Blocks

- (void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlockForHandler:(GenericCompletionHandler)handler
{
    return ^(AFHTTPRequestOperation *operation, id responseObject) {
        id handledObject = responseObject;
        ADNMetadata *metaObject = nil;
        
        if ([responseObject isKindOfClass:[ADNResponseEnvelope class]]) {
            handledObject = ((ADNResponseEnvelope *)responseObject).data;
            metaObject = ((ADNResponseEnvelope *)responseObject).meta;
        }

        if (handler) {
            handler(handledObject, metaObject, nil);
        }
    };
}

- (void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlockForModelOfClass:(Class)modelClass withHandler:(GenericCompletionHandler)handler
{
    return ^(AFHTTPRequestOperation *operation, id responseObject) {
        // By default, just pass the response object through
        id handledObject = responseObject;
        ADNMetadata *metaObject = nil;
        
        NSDictionary *externalRepresentation = nil;
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            externalRepresentation = responseObject;
        } else if ([responseObject isKindOfClass:[ADNResponseEnvelope class]]) {
            externalRepresentation = ((ADNResponseEnvelope *)responseObject).data;
            metaObject = ((ADNResponseEnvelope *)responseObject).meta;
        }
        
        if (externalRepresentation &&
            [modelClass isSubclassOfClass:[ADNModel class]]) {
            handledObject = [MTLJSONAdapter modelOfClass:modelClass fromJSONDictionary:externalRepresentation error:nil];
        }
        
        if (handler) {
            handler(handledObject, metaObject, nil);
        }
    };
}

- (void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlockForArrayofModelsOfClass:(Class)modelClass withHandler:(GenericCompletionHandler)handler
{
    return ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *externalArray = nil;
        ADNMetadata *metaObject = nil;

        if ([responseObject isKindOfClass:[NSArray class]]) {
            externalArray = responseObject;
        } else if ([responseObject isKindOfClass:[ADNResponseEnvelope class]]) {
            externalArray = ((ADNResponseEnvelope *)responseObject).data;
            metaObject = ((ADNResponseEnvelope *)responseObject).meta;
        }
        
        NSMutableArray *modelArray = nil;
        
        if (externalArray && [modelClass respondsToSelector:@selector(modelWithExternalRepresentation:)]) {
            modelArray = [NSMutableArray arrayWithCapacity:externalArray.count];
            for (id externalObject in externalArray) {
                [modelArray addObject:[modelClass modelWithExternalRepresentation:externalObject]];
            }
        } else {
            modelArray = [externalArray mutableCopy];
        }
        
        if (handler) {
            handler([modelArray copy], metaObject, nil);
        }
    };
}


- (void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlockForHandler:(GenericCompletionHandler)handler
{
    return ^(AFHTTPRequestOperation *operation, NSError *error) {
        if (handler) {
            ADNMetadata *metaObject = nil;
            
            ADNResponseEnvelope *envelope = [error.userInfo objectForKey:ADNResponseEnvelopeKey];
            if ([envelope isKindOfClass:[ADNResponseEnvelope class]]) {
                metaObject = envelope.meta;
            }

            handler(nil, metaObject, error);
        }
    };
}


@end
