//
//  ADNUserAPITests.m
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNUserAPITests.h"
#import <AppDotNet/ADNClient+ADNUser.h>

@implementation ADNUserAPITests

- (void)setUp
{
    [super setUp];
    
    [ADNClient sharedClient].accessToken = @"";

    self.semaphore = dispatch_semaphore_create(0);
}

- (void)tearDown
{
    while (dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
    [super tearDown];
}


#pragma mark - Tests

- (void)test_getUser
{
    NSString *userId = @"1";
    
    [[ADNClient sharedClient] getUser:userId withCompletionHandler:^(ADNUser *user, NSError *error) {
        STAssertNotNil(user, @"API call must return a user.");
        STAssertTrue([user isKindOfClass:[ADNUser class]], @"API call must return a user.");
        STAssertEqualObjects(user.userId, userId, @"Incorrect user.");
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_updateUser
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_getAvatarImageForUser
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_getCoverImageForUser
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_updateAvatarImage
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_updateCoverImage
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_followUser
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_unfollowUser
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_muteUser
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_unmuteUser
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_getUsers
{
    NSArray *usernamesOrIds = @[@1,@2,@3];
    
    [[ADNClient sharedClient] getUsers:usernamesOrIds withCompletionHandler:^(NSArray *objects, NSError *error) {
        STAssertNotNil(objects, @"API call must return an array.");
        STAssertTrue([objects isKindOfClass:[NSArray class]], @"API call must return an array.");
        STAssertEquals(objects.count, usernamesOrIds.count, @"Array must contain %i objects. (%i)", usernamesOrIds.count, objects.count);
        for (id object in objects) {
            STAssertTrue([object isKindOfClass:[ADNUser class]], @"Each object in the array must be an ADNUser. (%@)", [object class]);
        }
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_searchUsersWithQuery
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_getFollowedUsersForUser
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_getFollowersForUser
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_getFollowedUserIdsForUser
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_getFollowerIdsForUser
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_getMutedUsersForUser
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_getUsersWhoRepostedPost
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_getUsersWhoStarredPost
{
    dispatch_semaphore_signal(self.semaphore);
}

@end
