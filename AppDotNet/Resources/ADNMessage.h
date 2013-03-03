//
//  ADNMessage.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNText.h"
#import "ADNSource.h"
#import "ADNUser.h"


/**
 * A Message is very similar to a Post but 1) it doesn’t have to be public and
 * 2) it will be delivered to an arbitrary set of users (not just the users who
 * follow the Message creator). For an overview of the App.net messaging API,
 * please see the [Introduction to App.net Messaging](http://developers.app.net/docs/basics/messaging).
 *
 * http://developers.app.net/docs/resources/message
 */
@interface ADNMessage : ADNText

@property (nonatomic, copy)   NSString *channelId;
@property (nonatomic, copy)   NSDate *createdAt;
@property (nonatomic, copy)   NSString *messageId;
@property (nonatomic, assign) BOOL machineOnly;
@property (nonatomic, assign) NSUInteger numReplies;
@property (nonatomic, strong) ADNSource *source;
@property (nonatomic, copy)   NSString *threadId;
@property (nonatomic, strong) ADNUser *user;

@property (nonatomic, copy)   NSString *replyToId;
@property (nonatomic, assign) BOOL isDeleted;
@property (nonatomic, strong) NSArray *annotations;

@end
