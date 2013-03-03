//
//  ADNStream.h
//  AppDotNet
//
//  Created by Matt Rubin on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"


/**
 * A customized view of the global stream that is streamed to the client instead
 * of polling.
 * 
 * http://developers.app.net/docs/resources/stream
 */
@interface ADNStream : ADNModel

// NOTE: The stream API methods can only be accessed with an App token, which
// should never happen from a client app for security reasons
// (see http://developers.app.net/docs/authentication/flows/app-access-token/ )
// Thus, although this class represents a useful App.net resource, it will not
// be implemented unless the (unlikely) need arises for server-side Objective-C.

@end
