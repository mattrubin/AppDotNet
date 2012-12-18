//
//  ADNAuthenticationRequest.h
//  AppDotNet
//
//  Created by Me on 12/17/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    ADNAuthenticationResponseTypeCode,
    ADNAuthenticationResponseTypeToken
} ADNAuthenticationResponseType;

typedef enum {
    ADNScopeNone            = 0,
    ADNScopeBasic           = (1 << 0), // see basic information about this user
    ADNScopeStream          = (1 << 1), // read this user’s stream
    ADNScopeEmail           = (1 << 2), // access this user’s email address
    ADNScopeWritePost       = (1 << 3), // create a new post as this user
    ADNScopeFollow          = (1 << 4), // add or remove follows (or mutes) for this user
    ADNScopePublicMessages  = (1 << 5), // send and receive public messages as this user
    ADNScopeMessages        = (1 << 6), // send and receive public and private messages as this user
    ADNScopeUpdateProfile   = (1 << 7), // update a user’s name, images, and other profile information
    ADNScopeExport          = (1 << 8), // bulk export all of this user’s App.net data
} ADNScopes;


@interface ADNAuthenticationRequest : NSObject

@property NSString *clientID;
@property ADNAuthenticationResponseType responseType;
@property NSString *redirectURI;
@property ADNScopes scopes;
@property NSString *state;
@property BOOL appStoreCompliant;

- (NSURL*)URL;

+ (NSString*)stringForScopes:(ADNScopes)scopes;
+ (NSString*)stringForResponseType:(ADNAuthenticationResponseType)responseType;

@end
