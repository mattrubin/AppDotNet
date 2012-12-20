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

@property (nonatomic, copy) NSString *clientID;
@property (nonatomic, copy) NSString *clientLink;
@property (nonatomic, copy) NSString *clientName;

@property (nonatomic, copy) NSSet *scopes;

@property (nonatomic, strong) ADNUser *user;

@end
