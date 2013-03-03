//
//  ADNChannel.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"
#import "ADNUser.h"
#import "ADNAccessControlList.h"


/**
 * A Channel is a user created stream of Messages. It controls access to the
 * messages in the channel allowing for (among other things) public, private,
 * and group messaging. For an overview of the App.net messaging API, please
 * see the [Introduction to App.net Messaging](http://developers.app.net/docs/basics/messaging).
 * 
 * http://developers.app.net/docs/resources/channel
 */
@interface ADNChannel : ADNModel

@property (nonatomic, copy)   NSString *channelId;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, strong) ADNUser *owner;
@property (nonatomic, strong) NSArray *annotations;
@property (nonatomic, strong) ADNAccessControlList *readers;
@property (nonatomic, strong) ADNAccessControlList *writers;
@property (nonatomic, assign) BOOL youSubscribed;
@property (nonatomic, assign) BOOL youCanEdit;
@property (nonatomic, assign) BOOL hasUnread;
@property (nonatomic, copy)   NSString *recentMessageId;

@end
