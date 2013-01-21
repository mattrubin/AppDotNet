//
//  ADNMessage.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNText.h"
#import "ADNAnnotationCollection.h"
#import "ADNSource.h"
#import "ADNUser.h"


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
@property (nonatomic, strong) ADNAnnotationCollection *annotations;

@end
