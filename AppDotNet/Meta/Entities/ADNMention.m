//
//  ADNMention.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNMention.h"


@implementation ADNMention

- (NSDictionary *)alteredKeys
{
    return @{KEY_ID:@"userID", KEY_NAME:@"username", KEY_LEN:@"length", KEY_POS:@"position"};
}

- (NSArray *)exportKeys
{
    return @[KEY_ID, KEY_LEN, KEY_NAME, KEY_POS];
}


#pragma mark -

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: #%@ @%@ (%u @ %u)]", self.class, self.userID, self.username, self.length, self.position];
}

@end
