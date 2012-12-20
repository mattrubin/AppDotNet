//
//  ADNToken.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADNObject.h"

#import "ADNUser.h"


@interface ADNToken : ADNObject

@property NSString *clientID;
@property NSString *clientLink;
@property NSString *clientName;

@property NSSet *scopes;

@property ADNUser *user;

@end
