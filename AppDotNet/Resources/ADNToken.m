//
//  ADNToken.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNToken.h"


@implementation ADNToken

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"clientId": @"app.client_id",
            @"clientLink": @"app.link",
            @"clientName": @"app.name",
            }];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: client: (%@, %@, %@), scopes: %@, user: %@]", self.class, self.clientName, self.clientId, self.clientLink, self.scopes, self.user];
}

@end
