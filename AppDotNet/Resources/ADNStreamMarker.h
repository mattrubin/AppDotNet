//
//  ADNStreamMarker.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"


/**
 * Stream markers allows a User’s position in a stream of Posts to be synced
 * between multiple App.net clients. Then when you go from the browser to your
 * phone, your stream is right where you left off. The current stream marker
 * will be included in the response envelope from any stream that returns Posts.
 * 
 * http://developers.app.net/docs/resources/stream-marker
 */
@interface ADNStreamMarker : ADNModel

@end
