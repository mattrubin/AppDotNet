//
//  ADNInteraction.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"


/**
 * Interactions are objects that represent users taking certain actions on
 * App.net. Currently an Interaction is created when a User replies to, reposts,
 * or stars a Post, or follows another User. Interactions are structured to form
 * a sentence like: User X took action Y on object Z. If multiple users take the
 * same action (e.g. multiple users reply to one post) within a set time window
 * those events will be combined into a single Interaction.
 * 
 * http://developers.app.net/docs/resources/interaction
 */
@interface ADNInteraction : ADNModel

@end
