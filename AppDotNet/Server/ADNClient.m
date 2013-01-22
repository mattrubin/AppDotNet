//
//  ADNClient.m
//  AppDotNet
//
//  Created by Me on 1/17/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient.h"
#import "ADNJSONRequestOperation.h"
#import "ADNImageRequestOperation.h"
#include "ADNResponseEnvelope.h"


NSString * const ADNHeaderPrettyJSON = @"X-ADN-Pretty-JSON";


@implementation ADNClient

+ (instancetype)sharedClient
{
    static ADNClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ADNClient alloc] initWithBaseURL:[NSURL URLWithString:@"https://alpha-api.app.net/stream/0/"]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[ADNImageRequestOperation class]];
    [self registerHTTPOperationClass:[ADNJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (void)setAccessToken:(NSString *)accessToken
{
    _accessToken = [accessToken copy];
    
    if (_accessToken) {
        [self setDefaultHeader:@"Authorization"
                         value:[@"Bearer " stringByAppendingString:_accessToken]];
    } else {
        [self setDefaultHeader:@"Authorization"
                         value:nil];
    }
}

- (void)setPrettyJSON:(BOOL)prettyJSON
{
    _prettyJSON = prettyJSON;
    
    if (_prettyJSON) {
        [self setDefaultHeader:ADNHeaderPrettyJSON value:@"1"];
    } else {
        [self setDefaultHeader:ADNHeaderPrettyJSON value:nil];
    }
}

- (void)getEndpoint:(NSString *)path parameters:(NSDictionary *)parameters handler:(GenericCompletionHandler)handler
{
    [self getPath:path parameters:nil success:[self successBlockForHandler:handler] failure:[self failureBlockForHandler:handler]];
}


#pragma mark Default Blocks

- (void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlockForHandler:(GenericCompletionHandler)handler
{
    return ^(AFHTTPRequestOperation *operation, id responseObject) {
        if (handler) {
            handler(responseObject, nil);
        }
    };
}

- (void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlockForModelOfClass:(Class)modelClass withHandler:(GenericCompletionHandler)handler
{
    return ^(AFHTTPRequestOperation *operation, id responseObject) {
        // By default, just pass the response object through
        id handledObject = responseObject;
        
        NSDictionary *externalRepresentation = nil;
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            externalRepresentation = responseObject;
        } else if ([responseObject isKindOfClass:[ADNResponseEnvelope class]]) {
            externalRepresentation = ((ADNResponseEnvelope *)responseObject).data;
        }
        
        if (externalRepresentation &&
            [modelClass respondsToSelector:@selector(modelWithExternalRepresentation:)]) {
            handledObject = [modelClass modelWithExternalRepresentation:externalRepresentation];
        }
        
        if (handler) {
            handler(handledObject, nil);
        }
    };
}

- (void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlockForHandler:(GenericCompletionHandler)handler
{
    return ^(AFHTTPRequestOperation *operation, NSError *error) {
        if (handler) {
            handler(nil, error);
        }
    };
}



#pragma mark - Users

/*
 * Retrieve a User
 * GET /stream/0/users/[user_id]
 * http://developers.app.net/docs/resources/user/lookup/#retrieve-a-user
 */
- (void)getUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"users/%@", usernameOrID];
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForModelOfClass:[ADNUser class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

- (void)getCurrentUserWithCompletionHandler:(ADNUserCompletionHandler)handler
{
    [self getUser:@"me" withCompletionHandler:handler];
}

- (void)getUserWithID:(NSUInteger)userID completionHandler:(ADNUserCompletionHandler)handler
{
    [self getUser:[NSString stringWithFormat:@"%u", userID] withCompletionHandler:handler];
}

- (void)getUserWithUsername:(NSString*)username completionHandler:(ADNUserCompletionHandler)handler
{
    if (![username hasPrefix:@"@"]) {
        username = [@"@" stringByAppendingString:username];
    }
    
    [self getUser:username withCompletionHandler:handler];
}


/*
 * Update a User
 * PUT /stream/0/users/me
 * http://developers.app.net/docs/resources/user/profile/#update-a-user
 */
- (void)updateUser:(ADNUser *)user withCompletionHandler:(ADNUserCompletionHandler)handler
{
    
}

/*
 * Retrieve a User's avatar image
 * GET /stream/0/users/[user_id]/avatar
 * http://developers.app.net/docs/resources/user/profile/#retrieve-a-users-avatar-image
 */
- (void)getAvatarImageForUser:(NSString*)usernameOrID withCompletionHandler:(UIImageCompletionHandler)handler
{
    NSAssert(usernameOrID, @"You must specify a username or ID.");
    
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/avatar", usernameOrID];
    [self getEndpoint:endpoint parameters:nil handler:handler];
}

/*
 * Update a User's avatar image
 * POST /stream/0/users/me/avatar
 * http://developers.app.net/docs/resources/user/profile/#update-a-users-avatar-image
 */
- (void)updateAvatarImage:(id)image withCompletionHandler:(GenericCompletionHandler)handler
{
    
}

/*
 * Retrieve a User's cover image
 * GET /stream/0/users/[user_id]/cover
 * http://developers.app.net/docs/resources/user/profile/#retrieve-a-users-cover-image
 */
- (void)getCoverImageForUser:(NSString*)usernameOrID withCompletionHandler:(UIImageCompletionHandler)handler
{
    NSAssert(usernameOrID, @"You must specify a username or ID.");
    
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/cover", usernameOrID];
    [self getEndpoint:endpoint parameters:nil handler:handler];
}

/*
 * Update a User's cover image
 * POST /stream/0/users/me/cover
 * http://developers.app.net/docs/resources/user/profile/#update-a-users-cover-image
 */
- (void)updateCoverImage:(id)image withCompletionHandler:(GenericCompletionHandler)handler
{
    
}

/*
 * Follow a User
 * POST /stream/0/users/[user_id]/follow
 * http://developers.app.net/docs/resources/user/following/#follow-a-user
 */
- (void)followUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSAssert(usernameOrID, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/follow", usernameOrID];

    [self postPath:endpoint
        parameters:nil
           success:[self successBlockForModelOfClass:[ADNUser class] withHandler:handler]
           failure:[self failureBlockForHandler:handler]];
}

/*
 * Unfollow a User
 * DELETE /stream/0/users/[user_id]/follow
 * http://developers.app.net/docs/resources/user/following/#unfollow-a-user
 */
- (void)unfollowUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSAssert(usernameOrID, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/follow", usernameOrID];
    
    [self deletePath:endpoint
          parameters:nil
             success:[self successBlockForModelOfClass:[ADNUser class] withHandler:handler]
             failure:[self failureBlockForHandler:handler]];
}

/*
 * Mute a User
 * POST /stream/0/users/[user_id]/mute
 * http://developers.app.net/docs/resources/user/muting/#mute-a-user
 */
- (void)muteUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSAssert(usernameOrID, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/mute", usernameOrID];
    
    [self postPath:endpoint
        parameters:nil
           success:[self successBlockForModelOfClass:[ADNUser class] withHandler:handler]
           failure:[self failureBlockForHandler:handler]];
}

/*
 * Unmute a User
 * DELETE /stream/0/users/[user_id]/mute
 * http://developers.app.net/docs/resources/user/muting/#unmute-a-user
 */
- (void)unmuteUser:(NSString*)usernameOrID withCompletionHandler:(ADNUserCompletionHandler)handler
{
    NSAssert(usernameOrID, @"You must specify a username or ID.");
    NSString *endpoint = [NSString stringWithFormat:@"users/%@/mute", usernameOrID];
    
    [self deletePath:endpoint
          parameters:nil
             success:[self successBlockForModelOfClass:[ADNUser class] withHandler:handler]
             failure:[self failureBlockForHandler:handler]];
}


@end
