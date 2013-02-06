//
//  ADNFilter.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"


/**
 * A Filter restricts a stream of messages on the server side so your client
 * only sees what it’s interested in. Streams are currently the only way to use
 * filters right now.
 * 
 * http://developers.app.net/docs/resources/filter
 */
@interface ADNFilter : ADNModel

@end
