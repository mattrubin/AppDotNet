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
#import "ADNMessage.h"


typedef void (^GenericCompletionHandler)     (id            object,  NSError *error);
typedef void (^NSArrayCompletionHandler)     (NSArray      *objects, NSError *error);
typedef void (^NSDictionaryCompletionHandler)(NSDictionary *objects, NSError *error);
typedef void (^ADNUserCompletionHandler)     (ADNUser      *user,    NSError *error);
typedef void (^ADNTokenCompletionHandler)    (ADNToken     *token,   NSError *error);
typedef void (^ADNChannelCompletionHandler)  (ADNChannel   *channel, NSError *error);
typedef void (^ADNMessageCompletionHandler)  (ADNMessage   *message, NSError *error);


@interface ADN : NSObject

+ (NSString*)accessToken;
+ (void)setAccessToken:(NSString*)accessToken;

+ (BOOL)asynchronous;
+ (void)useAsynchronous:(BOOL)asynchronous;

// Tokens
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
+ (void)getSubscriberIDsForChannelsWithIDs:(NSArray*)channelIDs withCompletionHandler:(NSDictionaryCompletionHandler)handler;


// Messages
+ (void)getMessagesInChannelWithID:(NSString*)channelID                               withCompletionHandler:(NSArrayCompletionHandler)handler;
+ (void)createMessage:(ADNMessage*)message                                            withCompletionHandler:(ADNMessageCompletionHandler)handler;
+ (void)getMessageWithID:(NSString*)messageID    inChannelWithID:(NSString*)channelID withCompletionHandler:(ADNMessageCompletionHandler)handler;
+ (void)getMessagesWithIDs:(NSArray*)messageIDs                                       withCompletionHandler:(NSArrayCompletionHandler)handler;
+ (void)deleteMessageWithID:(NSString*)messageID inChannelWithID:(NSString*)channelID withCompletionHandler:(ADNMessageCompletionHandler)handler;


// Users
+ (void)getCurrentUserWithCompletionHandler:(ADNUserCompletionHandler)handler;
+ (void)getUser:(NSString*)usernameOrID     withCompletionHandler:(ADNUserCompletionHandler)handler;
+ (void)getUserWithID:(NSUInteger)userID        completionHandler:(ADNUserCompletionHandler)handler;
+ (void)getUserWithUsername:(NSString*)username completionHandler:(ADNUserCompletionHandler)handler;

@end
