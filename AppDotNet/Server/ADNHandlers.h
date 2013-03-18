//
//  ADNHandlers.h
//  AppDotNet
//
//  Created by Matt Rubin on 1/17/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//


#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
@class UIImage;
#else
@class NSImage;
#endif
@class ADNUser, ADNToken, ADNChannel, ADNMessage, ADNText, ADNMetadata, ADNFile, ADNPost;


typedef void (^GenericCompletionHandler)     (id            object,  ADNMetadata *meta, NSError *error);
typedef void (^NSArrayCompletionHandler)     (NSArray      *objects, ADNMetadata *meta, NSError *error);
#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
typedef void (^UIImageCompletionHandler)     (UIImage      *image,   ADNMetadata *meta, NSError *error);
#else
typedef void (^NSImageCompletionHandler)     (NSImage      *image,   ADNMetadata *meta, NSError *error);
#endif
typedef void (^NSDictionaryCompletionHandler)(NSDictionary *objects, ADNMetadata *meta, NSError *error);
typedef void (^ADNUserCompletionHandler)     (ADNUser      *user,    ADNMetadata *meta, NSError *error);
typedef void (^ADNTokenCompletionHandler)    (ADNToken     *token,   ADNMetadata *meta, NSError *error);
typedef void (^ADNChannelCompletionHandler)  (ADNChannel   *channel, ADNMetadata *meta, NSError *error);
typedef void (^ADNMessageCompletionHandler)  (ADNMessage   *message, ADNMetadata *meta, NSError *error);
typedef void (^ADNTextCompletionHandler)     (ADNText      *text,    ADNMetadata *meta, NSError *error);
typedef void (^ADNFileCompletionHandler)     (ADNFile      *file,    ADNMetadata *meta, NSError *error);
typedef void (^ADNPostCompletionHandler)	 (ADNPost	   *post,	 ADNMetadata *meta, NSError *error);
