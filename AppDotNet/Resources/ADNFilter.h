//
//  ADNFilter.h
//  AppDotNet
//
//  Created by Matt Rubin on 12/15/12.
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

// NOTE: The stream API methods can only be accessed with an App token, which
// should never happen from a client app for security reasons
// (see http://developers.app.net/docs/authentication/flows/app-access-token/ )
// Thus, although this class represents a useful App.net resource, it will not
// be implemented unless the (unlikely) need arises for server-side Objective-C.

@end
