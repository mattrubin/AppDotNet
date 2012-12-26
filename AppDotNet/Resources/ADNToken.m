//
//  ADNToken.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNToken.h"

#import "NSDictionary+ADN.h"


@implementation ADNToken

- (void)setAttributesFromDictionary:(NSDictionary *)dictionary
{
    NSDictionary *appInfo = [dictionary dictionaryForKey:KEY_APP];
    self.clientID   = [appInfo stringForKey:KEY_CLIENT_ID];
    self.clientLink = [appInfo stringForKey:KEY_LINK];
    self.clientName = [appInfo stringForKey:KEY_NAME];
    
    NSArray *scopesArray = [dictionary arrayForKey:KEY_SCOPES];
    self.scopes = [NSMutableArray arrayWithCapacity:scopesArray.count];
    for (NSString *scopeString in scopesArray) {
        [(NSMutableArray*)self.scopes addObject:scopeString];
    }
    
    self.user = [ADNUser instanceFromDictionary:[dictionary dictionaryForKey:KEY_USER]];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: client: (%@, %@, %@), scopes: %@, user: %@]", self.class, self.clientName, self.clientID, self.clientLink, self.scopes, self.user];
}

@end
