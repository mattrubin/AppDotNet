//
//  ADNMessage.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADNObject.h"
#import "ADNAnnotationCollection.h"

@class ADNEntities;
@class ADNSource;
@class ADNUser;


@interface ADNMessage : ADNObject

@property (nonatomic, copy)   NSString *channelID;
@property (nonatomic, copy)   NSDate *createdAt;
@property (nonatomic, strong) ADNEntities *entities;
@property (nonatomic, copy)   NSString *html;
@property (nonatomic, copy)   NSString *messageID;
@property (nonatomic, assign) BOOL machineOnly;
@property (nonatomic, assign) NSUInteger numReplies;
@property (nonatomic, strong) ADNSource *source;
@property (nonatomic, copy)   NSString *text;
@property (nonatomic, copy)   NSString *threadID;
@property (nonatomic, strong) ADNUser *user;

@property (nonatomic, copy)   NSString *replyToID;
@property (nonatomic, assign) BOOL isDeleted;
@property (nonatomic, strong) ADNAnnotationCollection *annotations;

@end
