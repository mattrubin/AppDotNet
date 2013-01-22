//
//  ADNAuthenticationRequest.m
//  AppDotNet
//
//  Created by Me on 12/17/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNAuthenticationRequest.h"


#define AUTH_HOST       @"account.app.net"
#define AUTH_ENDPOINT   @"/oauth/authenticate"


@implementation ADNAuthenticationRequest

- (NSURL*)URL
{
    NSString *urlString = [NSString stringWithFormat:@"https://%@%@", AUTH_HOST, AUTH_ENDPOINT];
    
    urlString = [urlString stringByAppendingFormat:@"?client_id=%@", self.clientId];
    urlString = [urlString stringByAppendingFormat:@"&response_type=%@", [self.class stringForResponseType:self.responseType]];
    if (self.redirectURI)
        urlString = [urlString stringByAppendingFormat:@"&redirect_uri=%@", self.redirectURI];
    if (self.scopes)
        urlString = [urlString stringByAppendingFormat:@"&scope=%@", [self.class stringForScopes:self.scopes]];
    if (self.appStoreCompliant) {
        urlString = [urlString stringByAppendingString:@"&adnview=appstore"];
    }
    if (self.state) {
        urlString = [urlString stringByAppendingFormat:@"&state=%@", self.state];
    }
    
    return [NSURL URLWithString:urlString];
}

+ (NSString*)stringForScopes:(ADNScopes)scopes
{
    if (scopes == ADNScopeNone) return nil;
    
    NSMutableArray *scopeStrings = [NSMutableArray arrayWithCapacity:10];
    
    if (scopes & ADNScopeBasic)             [scopeStrings addObject:@"basic"];
    if (scopes & ADNScopeStream)            [scopeStrings addObject:@"stream"];
    if (scopes & ADNScopeEmail)             [scopeStrings addObject:@"email"];
    if (scopes & ADNScopeWritePost)         [scopeStrings addObject:@"write_post"];
    if (scopes & ADNScopeFollow)            [scopeStrings addObject:@"follow"];
    if (scopes & ADNScopePublicMessages)    [scopeStrings addObject:@"public_messages"];
    if (scopes & ADNScopeMessages)          [scopeStrings addObject:@"messages"];
    if (scopes & ADNScopeUpdateProfile)     [scopeStrings addObject:@"update_profile"];
    if (scopes & ADNScopeExport)            [scopeStrings addObject:@"export"];
    
    return [scopeStrings componentsJoinedByString:@","];
}

+ (NSString*)stringForResponseType:(ADNAuthenticationResponseType)responseType
{
    switch (responseType) {
        case ADNAuthenticationResponseTypeToken:
            return @"token";
        case ADNAuthenticationResponseTypeCode:
            return @"code";
        default:
            return nil;
    }
}

@end
