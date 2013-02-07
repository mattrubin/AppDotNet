//
//  ADNToken.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"
#import "ADNSource.h"
#import "ADNUser.h"


/**
 * Info about the current OAuth access token. If the token is a user token the
 * response will include a User object.
 * 
 * http://developers.app.net/docs/resources/token
 */
@interface ADNToken : ADNModel

@property (nonatomic, copy) NSString *clientId;
@property (nonatomic, strong) ADNSource *app;

@property (nonatomic, strong) NSArray *scopes;

// The total storage capacity is 10GB, which could exceed NSUIntegerMax when
// measured in bytes, so we use `unsigned long long` instead.
@property (nonatomic, assign) unsigned long long storageAvailable;
@property (nonatomic, assign) unsigned long long storageUsed;

@property (nonatomic, strong) ADNUser *user;

@end
