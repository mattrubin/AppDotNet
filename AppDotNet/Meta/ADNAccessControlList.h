//
//  ADNAccessControlList.h
//  AppDotNet
//
//  Created by Matt Rubin on 12/18/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNObject.h"


@interface ADNAccessControlList : ADNObject

@property (nonatomic, assign) BOOL anyUser;
@property (nonatomic, assign) BOOL immutable;
@property (nonatomic, assign) BOOL public;
@property (nonatomic, assign) BOOL you;
@property (nonatomic, copy)   NSArray *userIDs;

@end
