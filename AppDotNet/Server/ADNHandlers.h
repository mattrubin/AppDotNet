//
//  ADNHandlers.h
//  AppDotNet
//
//  Created by Me on 1/17/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//


@class ADNUser, ADNToken, ADNChannel, ADNMessage;


typedef void (^GenericCompletionHandler)     (id            object,  NSError *error);
typedef void (^NSArrayCompletionHandler)     (NSArray      *objects, NSError *error);
typedef void (^NSDictionaryCompletionHandler)(NSDictionary *objects, NSError *error);
typedef void (^ADNUserCompletionHandler)     (ADNUser      *user,    NSError *error);
typedef void (^ADNTokenCompletionHandler)    (ADNToken     *token,   NSError *error);
typedef void (^ADNChannelCompletionHandler)  (ADNChannel   *channel, NSError *error);
typedef void (^ADNMessageCompletionHandler)  (ADNMessage   *message, NSError *error);
