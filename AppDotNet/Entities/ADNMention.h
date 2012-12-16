//
//  ADNMention.h
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADNMention : NSObject

// The username being mentioned (doesn't include '@').
@property NSString *username;
// The user id of the mentioned user.
@property NSUInteger userID;
// The 0 based index where this entity begins text (include @).
@property NSUInteger position;
// The length of the substring in text that represents this mention. Since @ is included, len will be the length of the name + 1.
@property NSUInteger length;


- (id)initWithDictionary:(NSDictionary*)dictionary;
+ (id)mentionFromDictionary:(NSDictionary*)dictionary;

- (void)updateWithDictionary:(NSDictionary*)dictionary;

@end
