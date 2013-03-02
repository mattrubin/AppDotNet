//
//  ADNChannel.h
//  AppDotNet
//
//  Created by Matt Rubin on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"
#import "ADNUser.h"
#import "ADNAccessControlList.h"
#import "ADNAnnotationCollection.h"


/**
 * A Channel is a user created stream of Messages. It controls access to the
 * messages in the channel allowing for (among other things) public, private,
 * and group messaging. For an overview of the App.net messaging API, please
 * see the [Introduction to App.net Messaging](http://developers.app.net/docs/basics/messaging).
 * 
 * http://developers.app.net/docs/resources/channel
 */
@interface ADNChannel : ADNModel

/// Primary identifier for a Channel.
@property (nonatomic, copy)   NSString *channelId;

/// A string that looks like a reversed domain name to identify the intended purpose of this Channel.
/// There is no authentication or authorization performed on this field. Just because you create channels with the type `com.example.awesome` does not imply you are the only one that is using that namespace or that the channel ACLs will match the format you expect. `net.app.core` is a reserved namespace.
@property (nonatomic, copy)   NSString *type;

/// This is an embedded version of the User object.
/// In certain cases (e.g., when a user account has been deleted), this key may be omitted.
@property (nonatomic, strong) ADNUser *owner;

/// Metadata about the Channel. See the Annotations documentation.
@property (nonatomic, strong) ADNAnnotationCollection *annotations;

/// The access control list that describes who can read this Channel and its Messages.
@property (nonatomic, strong) ADNAccessControlList *readers;
/// The access control list that describes who can write Messages to this Channel.
@property (nonatomic, strong) ADNAccessControlList *writers;

/// Are you currently subscribed to this Channel. There are many Channels you could have access to read and this indicates whether you are "following" this Channel.
@property (nonatomic, assign) BOOL youSubscribed;
/// Are you allowed to edit the Channel.
@property (nonatomic, assign) BOOL youCanEdit;
/// Are there unread Messages in this Channel (according to the `last_read_id` of the Stream Marker you have saved for this Channel)?
@property (nonatomic, assign) BOOL hasUnread;

/// The ID of the most recent Message in this channel.
/// This may be a deleted Message or a Message from a muted User.
@property (nonatomic, copy)   NSString *recentMessageId;

// TODO: recent_message
// TODO: counts

@end
