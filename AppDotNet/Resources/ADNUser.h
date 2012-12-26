//
//  ADNUser.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNObject.h"
#import "ADNDescription.h"
#import "ADNImage.h"
#import "ADNCounts.h"
#import "ADNAnnotationCollection.h"


typedef enum {
    ADNUserTypeHuman        = (1 << 0),
    ADNUserTypeBot          = (1 << 1),
    ADNUserTypeCorporate    = (1 << 2),
    ADNUserTypeFeed         = (1 << 3),
    ADNUserTypeUnknown      = 0
} ADNUserType;


/**
 * A User is the central object of the App.net APIs.
 * User objects have usernames, follow other users, and post content for their followers.
 */
@interface ADNUser : ADNObject

// Primary identifier for a user. This idspace is unique to User objects. There can be a Post and User with the same ID; no relation is implied.
@property (nonatomic, copy) NSString *userID;

// Case insensitive. 20 characters, may only contain a-z, 0-9 and underscore.
@property (nonatomic, copy) NSString *username;
// User supplied descriptive name. May be a pseudonym. All Unicode characters allowed. Maximum length 50 characters.
@property (nonatomic, copy) NSString *name;


// User supplied biographical information. All Unicode characters allowed. Maximum length 256 characters.
@property (nonatomic, strong) ADNDescription *description;


// User timezone in tzinfo format.
@property (nonatomic, copy) NSString *timezone;
// User locale in ISO format.
@property (nonatomic, copy) NSString *locale;


// Object representing the URL and original size of the user's avatar.
@property (nonatomic, strong) ADNImage *avatarImage;
// Object representing the URL and original size of the user's cover image.
@property (nonatomic, strong) ADNImage *coverImage;


// An account can be one of the following types: human, bot, corporate, or feed.
@property (nonatomic, copy) NSString *type;

// The time at which the User was created in ISO 8601 format.
@property (nonatomic, copy) NSDate *createdAt;
// The URL of the user's detail page on Alpha.
@property (nonatomic, copy) NSString *canonicalURL;



// A count of followers, following, posts, and stars
@property (nonatomic, strong) ADNCounts *counts;


// Does this user follow the user making the request? May be omitted if this is not an authenticated request.
@property (nonatomic, assign) BOOL followsYou;
// Does the user making the request follow this user? May be omitted if this is not an authenticated request.
@property (nonatomic, assign) BOOL youFollow;
// Has the user making the request blocked this user? May be omitted if this is not an authenticated request.
@property (nonatomic, assign) BOOL youMuted;
//Does the user making the request have the ability to subscribe this user to channels? May be omitted if this is not an authenticated request.
@property (nonatomic, assign) BOOL youCanSubscribe;


// Metadata about the user. See the Annotations documentation.
@property (nonatomic, strong) ADNAnnotationCollection *annotations;


@end
