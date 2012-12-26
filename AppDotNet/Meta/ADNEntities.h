//
//  ADNEntities.h
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNObject.h"
#import "ADNMention.h"
#import "ADNHashtag.h"
#import "ADNLink.h"


@interface ADNEntities : ADNObject

@property (nonatomic, strong, readonly) NSMutableArray *mentions;
@property (nonatomic, strong, readonly) NSMutableArray *hashtags;
@property (nonatomic, strong, readonly) NSMutableArray *links;

@end
