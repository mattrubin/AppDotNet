//
//  ADNEntities.h
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADNObject.h"

#import "ADNMention.h"
#import "ADNHashtag.h"
#import "ADNLink.h"


@interface ADNEntities : ADNObject

@property NSArray *mentions;
@property NSArray *hashtags;
@property NSArray *links;

@end
