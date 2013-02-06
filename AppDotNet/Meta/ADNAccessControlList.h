//
//  ADNAccessControlList.h
//  AppDotNet
//
//  Created by Matt Rubin on 12/18/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"


/**
 * Access control lists (ACLs) specify who can read and who can write Messages
 * in a Channel. In our permissions model, writing implies reading. Note that
 * `any_user`, `public`, and non-empty `user_ids` are all mutually exclusive
 * (only one of those can be true at a time). Also, the creator of a Channel
 * always has write access and will not be specified in the `user_ids` list.
 * For some Channel types (like net.app.core.pm), the ACLs will be sanitized to
 * make sure they fit a specific schema. Please see the Messaging overview for
 * more information.
 * 
 * http://developers.app.net/docs/resources/channel/#acl
 */
@interface ADNAccessControlList : ADNModel

@property (nonatomic, assign) BOOL anyUser;
@property (nonatomic, assign) BOOL immutable;
@property (nonatomic, assign) BOOL public;
@property (nonatomic, assign) BOOL you;
@property (nonatomic, strong) NSMutableArray *userIds;

@end
