//
//  ADNToken.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNToken.h"

#import "NSDictionary+ADN.h"


#define TOKEN_KEY_CLIENT_ID @"client_id"
#define TOKEN_KEY_APP       @"app"
#define TOKEN_KEY_APP_NAME  @"name"
#define TOKEN_KEY_APP_LINK  @"link"
#define TOKEN_KEY_SCOPES    @"scopes"
#define TOKEN_KEY_USER      @"user"


@implementation ADNToken

- (void)setAttributesFromDictionary:(NSDictionary *)dictionary
{
    NSDictionary *appInfo = [dictionary dictionaryForKey:TOKEN_KEY_APP];
    self.clientID   = [appInfo stringForKey:TOKEN_KEY_CLIENT_ID];
    self.clientLink = [appInfo stringForKey:TOKEN_KEY_APP_LINK];
    self.clientName = [appInfo stringForKey:TOKEN_KEY_APP_NAME];
    
    NSArray *scopesArray = [dictionary arrayForKey:TOKEN_KEY_SCOPES];
    self.scopes = [NSMutableArray arrayWithCapacity:scopesArray.count];
    for (NSString *scopeString in scopesArray) {
        [(NSMutableArray*)self.scopes addObject:scopeString];
    }
    
    self.user = [ADNUser instanceFromDictionary:[dictionary dictionaryForKey:TOKEN_KEY_USER]];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@: client: (%@, %@, %@), scopes: %@, user: %@]", self.class, self.clientName, self.clientID, self.clientLink, self.scopes, self.user];
}

@end
