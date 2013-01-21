//
//  ADNToken.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"
#import "ADNUser.h"


@interface ADNToken : ADNModel

@property (nonatomic, copy) NSString *clientId;
@property (nonatomic, copy) NSString *clientLink;
@property (nonatomic, copy) NSString *clientName;

@property (nonatomic, strong) NSArray *scopes;

@property (nonatomic, strong) ADNUser *user;

@end
