//
//  ADNEntities.h
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"
#import "ADNMention.h"
#import "ADNHashtag.h"
#import "ADNLink.h"


@interface ADNEntities : ADNModel

@property (nonatomic, strong) NSMutableArray *mentions;
@property (nonatomic, strong) NSMutableArray *hashtags;
@property (nonatomic, strong) NSMutableArray *links;

@end
