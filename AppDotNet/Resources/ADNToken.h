//
//  ADNToken.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"
#import "ADNUser.h"


/**
 * Info about the current OAuth access token. If the token is a user token the
 * response will include a User object.
 * 
 * http://developers.app.net/docs/resources/token
 */
@interface ADNToken : ADNModel

@property (nonatomic, copy) NSString *clientId;
@property (nonatomic, copy) NSString *clientLink;
@property (nonatomic, copy) NSString *clientName;

@property (nonatomic, strong) NSArray *scopes;

@property (nonatomic, strong) ADNUser *user;

@end
