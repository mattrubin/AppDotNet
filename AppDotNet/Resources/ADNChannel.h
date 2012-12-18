//
//  ADNChannel.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ADNUser.h"
#import "ADNAccessControlList.h"
#import "ADNAnnotation.h"


@interface ADNChannel : NSObject

@property (nonatomic, copy)   NSNumber *channelID;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, strong) ADNUser *owner;
@property (nonatomic, strong) ADNAccessControlList *readers;
@property (nonatomic, strong) ADNAccessControlList *writers;
@property (nonatomic, assign) BOOL hasUnread;
@property (nonatomic, assign) BOOL youCanEdit;
@property (nonatomic, assign) BOOL youSubscribed;
@property (nonatomic, copy)   NSArray *annotations;


+ (ADNChannel *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
