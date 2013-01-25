//
//  ADNHandlers.h
//  AppDotNet
//
//  Created by Me on 1/17/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//


@class UIImage;
@class ADNUser, ADNToken, ADNChannel, ADNMessage, ADNText, ADNMetadata;


typedef void (^GenericCompletionHandler)     (id            object,  ADNMetadata *meta, NSError *error);
typedef void (^NSArrayCompletionHandler)     (NSArray      *objects, ADNMetadata *meta, NSError *error);
typedef void (^UIImageCompletionHandler)     (UIImage      *image,   ADNMetadata *meta, NSError *error);
typedef void (^NSDictionaryCompletionHandler)(NSDictionary *objects, ADNMetadata *meta, NSError *error);
typedef void (^ADNUserCompletionHandler)     (ADNUser      *user,    ADNMetadata *meta, NSError *error);
typedef void (^ADNTokenCompletionHandler)    (ADNToken     *token,   ADNMetadata *meta, NSError *error);
typedef void (^ADNChannelCompletionHandler)  (ADNChannel   *channel, ADNMetadata *meta, NSError *error);
typedef void (^ADNMessageCompletionHandler)  (ADNMessage   *message, ADNMetadata *meta, NSError *error);
typedef void (^ADNTextCompletionHandler)     (ADNText      *text,    ADNMetadata *meta, NSError *error);
