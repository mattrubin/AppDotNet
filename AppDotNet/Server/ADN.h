//
//  ADN.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ADNUser.h"
#import "ADNToken.h"
#import "ADNChannel.h"


typedef void (^NSArrayCompletionHandler)  (NSArray    *objects, NSError *error);
typedef void (^ADNUserCompletionHandler)   (ADNUser    *user,    NSError *error);
typedef void (^ADNTokenCompletionHandler)  (ADNToken   *token,   NSError *error);
typedef void (^ADNChannelCompletionHandler)(ADNChannel *channel, NSError *error);


@interface ADN : NSObject

+ (NSString*)accessToken;
+ (void)setAccessToken:(NSString*)accessToken;

+ (void)getTokenWithCompletionHandler:(ADNTokenCompletionHandler)handler;

// Channel
+ (void)createChannel:(ADNChannel*)channel      withCompletionHandler:(ADNChannelCompletionHandler)handler;
+ (void)updateChannel:(ADNChannel*)channel      withCompletionHandler:(ADNChannelCompletionHandler)handler;
+ (void)getChannelWithID:(NSNumber*)channelID   withCompletionHandler:(ADNChannelCompletionHandler)handler;
+ (void)getChannelsWithIDs:(NSArray*)channelIDs withCompletionHandler:(NSArrayCompletionHandler)handler;

// Channel Subscription
+ (void)getSubscribedChannelsWithCompletionHandler:(NSArrayCompletionHandler)handler;
+ (void)subscribeToChannelWithID:(NSNumber*)channelID         withCompletionHandler:(ADNChannelCompletionHandler)handler;
+ (void)unsubscribeFromChannelWithID:(NSNumber*)channelID     withCompletionHandler:(ADNChannelCompletionHandler)handler;
+ (void)getSubscribersForChannelWithID:(NSNumber*)channelID   withCompletionHandler:(NSArrayCompletionHandler)handler;
+ (void)getSubscriberIDsForChannelWithID:(NSNumber*)channelID withCompletionHandler:(NSArrayCompletionHandler)handler;


+ (void)getCurrentUserWithCompletionHandler:(ADNUserCompletionHandler)handler;
+ (void)getUser:(NSString*)usernameOrID     withCompletionHandler:(ADNUserCompletionHandler)handler;
+ (void)getUserWithID:(NSUInteger)userID        completionHandler:(ADNUserCompletionHandler)handler;
+ (void)getUserWithUsername:(NSString*)username completionHandler:(ADNUserCompletionHandler)handler;

@end
