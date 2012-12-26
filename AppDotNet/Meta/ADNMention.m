//
//  ADNMention.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNMention.h"

#import "NSDictionary+ADN.h"


@implementation ADNMention

- (NSDictionary *)alteredKeys
{
    return @{@"id":@"userID", @"name":@"username", @"len":@"length", @"pos":@"position"};
}

- (NSArray *)exportKeys
{
    return @[@"id", @"len", @"name", @"pos"];
}



#pragma mark -

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: #%@ @%@ (%u @ %u)]", self.class, self.userID, self.username, self.length, self.position];
}

@end
