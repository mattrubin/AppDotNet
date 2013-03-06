//
//  ADNMessage.h
//  AppDotNet
//
//  Created by Matt Rubin on 12/15/12.
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

/// Primary identifier for a Message.
@property (nonatomic, copy)   NSString *messageId;
/// The id of the Channel this Message belongs to.
@property (nonatomic, copy)   NSString *channelId;

/// This is an embedded version of the User object.
/// In certain cases (e.g., when a user account has been deleted), this key may be omitted.
@property (nonatomic, strong) ADNUser *user;
/// The time at which the Message was create in ISO 8601 format.
@property (nonatomic, copy)   NSDate *createdAt;

/// The API consumer that created this Message.
@property (nonatomic, strong) ADNSource *source;

/// The id of the Message this Message is replying to (or null if not a reply).
@property (nonatomic, copy)   NSString *replyToId;
/// The id of the post at the root of the thread that this Message is a part of.
/// If thread_id==id then this property does not guarantee that the thread has > 1 Message. Please see numReplies.
@property (nonatomic, copy)   NSString *threadId;
/// The number of messages created in reply to this Message.
@property (nonatomic, assign) NSUInteger numReplies;

/// Metadata about the entire Message. See the Annotations documentation.
@property (nonatomic, strong) NSArray *annotations;

/// Has this message been deleted?
/// If a Message has been deleted, the text, html, and entities properties will be empty and may be omitted.
// TODO: For non-deleted Messages, this key may be omitted instead of being false.
@property (nonatomic, assign) BOOL isDeleted;
/// Is this Message meant for humans or other apps?
@property (nonatomic, assign) BOOL machineOnly;

@end
