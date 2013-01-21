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
#import "ADNAnnotationCollection.h"


@interface ADNChannel : ADNModel

@property (nonatomic, copy)   NSString *channelId;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, strong) ADNUser *owner;
@property (nonatomic, strong) ADNAnnotationCollection *annotations;
@property (nonatomic, strong) ADNAccessControlList *readers;
@property (nonatomic, strong) ADNAccessControlList *writers;
@property (nonatomic, assign) BOOL youSubscribed;
@property (nonatomic, assign) BOOL youCanEdit;
@property (nonatomic, assign) BOOL hasUnread;
@property (nonatomic, copy)   NSString *recentMessageId;

@end
