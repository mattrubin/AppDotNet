//
//  ADNUser.h
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADNObject.h"

#import "ADNEntities.h"
#import "ADNImage.h"
#import "ADNAnnotation.h"


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
@property (nonatomic, assign) NSUInteger userID;

// Case insensitive. 20 characters, may only contain a-z, 0-9 and underscore.
@property (nonatomic, copy) NSString *username;
// User supplied descriptive name. May be a pseudonym. All Unicode characters allowed. Maximum length 50 characters.
@property (nonatomic, copy) NSString *name;


// User supplied biographical information. All Unicode characters allowed. Maximum length 256 characters.
@property (nonatomic, copy) NSString *descriptionText;
// Server-generated annotated HTML version of biographical information.
@property (nonatomic, copy) NSString *descriptionHTML;
// Entities included in biographical information. See information on entities for reference.
@property (nonatomic, strong) ADNEntities *descriptionEntities;


// User timezone in tzinfo format.
@property (nonatomic, copy) NSString *timezone;
// User locale in ISO format.
@property (nonatomic, copy) NSString *locale;


// Object representing the URL and original size of the user's avatar.
@property (nonatomic, strong) ADNImage *avatarImage;
// Object representing the URL and original size of the user's cover image.
@property (nonatomic, strong) ADNImage *coverImage;


// An account can be one of the following types: human, bot, corporate, or feed.
@property (nonatomic, assign) ADNUserType type;
@property (nonatomic, copy) NSString *typeString;
// The time at which the User was created in ISO 8601 format.
@property (nonatomic, copy) NSDate *createdAt;


// The number of users this user is following.
@property (nonatomic, assign) NSUInteger followingCount;
// The number of users following this user.
@property (nonatomic, assign) NSUInteger followerCount;
// The number of posts created by this user.
@property (nonatomic, assign) NSUInteger postCount;
// The number of posts starred by this user.
@property (nonatomic, assign) NSUInteger starCount;


// Does this user follow the user making the request? May be omitted if this is not an authenticated request.
@property (nonatomic, assign) BOOL followsYou;
// Does the user making the request follow this user? May be omitted if this is not an authenticated request.
@property (nonatomic, assign) BOOL youFollow;
// Has the user making the request blocked this user? May be omitted if this is not an authenticated request.
@property (nonatomic, assign) BOOL youMuted;


// Metadata about the user. See the Annotations documentation.
@property (nonatomic, copy) NSDictionary *annotations;


@end
