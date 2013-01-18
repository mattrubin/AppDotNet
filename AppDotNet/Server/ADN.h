//
//  ADN.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ADNHandlers.h"

#import "ADNUser.h"
#import "ADNToken.h"
#import "ADNChannel.h"
#import "ADNMessage.h"


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
+ (void)getChannelWithID:(NSString*)channelID   withCompletionHandler:(ADNChannelCompletionHandler)handler;
+ (void)getChannelsWithIDs:(NSArray*)channelIDs withCompletionHandler:(NSArrayCompletionHandler)handler;

// Channel Subscription
+ (void)getSubscribedChannelsWithCompletionHandler:(NSArrayCompletionHandler)handler;
+ (void)subscribeToChannelWithID:(NSString*)channelID           withCompletionHandler:(ADNChannelCompletionHandler)handler;
+ (void)unsubscribeFromChannelWithID:(NSString*)channelID       withCompletionHandler:(ADNChannelCompletionHandler)handler;
+ (void)getSubscribersForChannelWithID:(NSString*)channelID     withCompletionHandler:(NSArrayCompletionHandler)handler;
+ (void)getSubscriberIDsForChannelWithID:(NSString*)channelID   withCompletionHandler:(NSArrayCompletionHandler)handler;
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
