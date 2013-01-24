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


/**
 * Entities allow users and applications to provide rich text formatting for posts. They provide
 * common formatting for mentions and hashtags but they also allow links to be embedded with anchor
 * text which gives more context. Each entity type is a list with 0 or more entities of the same type.
 * 
 * Entities are designed to be very simple to render — they should relatively easily translate into
 * NSAttributedString objects and the like.
 * 
 * Usually entities are extracted from the Post text by App.net’s servers. We allow users to specify
 * some entities at Post creation time. Please refer to the user specified entities documentation
 * for more information.
 * 
 * Ranges specified by entities may be adjacent, but may not overlap.
 */
@interface ADNEntities : ADNModel

/// An array of ADNMention objects.
@property (nonatomic, strong) NSMutableArray *mentions;

/// An array of ADNHashtag objects.
@property (nonatomic, strong) NSMutableArray *hashtags;

/// An array of ADNLink objects.
@property (nonatomic, strong) NSMutableArray *links;

@end
