//
//  ADNUserAPITests.m
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNUserAPITests.h"
#import <AppDotNet/ADNClient+ADNUser.h>
#import <UIKit/UIImage.h>


NSString * const TestUserName = @"@appstoretestuser";
NSString * const TestUserId = @"1";
NSString * const TestAccessToken = @"";


@implementation ADNUserAPITests

- (void)setUp
{
    [super setUp];
    
    [ADNClient sharedClient].accessToken = TestAccessToken;

    self.semaphore = dispatch_semaphore_create(0);
}

- (void)tearDown
{
    while (dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
    [super tearDown];
}


#pragma mark Helper Methods

- (void)ensureObject:(id)object isKindOfClass:(Class)class
{
    STAssertNotNil(object, @"API call must return an object of class %@.", class);
    STAssertTrue([object isKindOfClass:class], @"API call must return an object of class %@.", class);
}

- (void)ensureCollection:(id <NSFastEnumeration>)collection containsObjectsOfClass:(Class)class
{
    for (id object in collection) {
        STAssertTrue([object isKindOfClass:class], @"The collection must contain objects of class %@.", class);
    }
}


#pragma mark - Tests

- (void)test_getUser
{
    [[ADNClient sharedClient] getUser:TestUserId withCompletionHandler:^(ADNUser *user, NSError *error)
    {
        [self ensureObject:user isKindOfClass:[ADNUser class]];
        STAssertEqualObjects(user.userId, TestUserId, @"Incorrect user.");
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_updateUser
{
    dispatch_semaphore_signal(self.semaphore);
}

- (void)test_getAvatarImageForUser
{
    [[ADNClient sharedClient] getAvatarImageForUser:TestUserName withCompletionHandler:^(UIImage *image, NSError *error)
    {
        [self ensureObject:image isKindOfClass:[UIImage class]];
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_getCoverImageForUser
{
    [[ADNClient sharedClient] getCoverImageForUser:TestUserName withCompletionHandler:^(UIImage *image, NSError *error)
    {
        [self ensureObject:image isKindOfClass:[UIImage class]];
        
        dispatch_semaphore_signal(self.semaphore);
    }];
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
    [[ADNClient sharedClient] followUser:TestUserName withCompletionHandler:^(ADNUser *user, NSError *error)
    {
        [self ensureObject:user isKindOfClass:[ADNUser class]];
        STAssertTrue(user.youFollow, @"You should now be following the user.");

        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_unfollowUser
{
    [[ADNClient sharedClient] unfollowUser:TestUserName withCompletionHandler:^(ADNUser *user, NSError *error)
    {
        [self ensureObject:user isKindOfClass:[ADNUser class]];
        STAssertFalse(user.youFollow, @"You should not be following the user.");
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_muteUser
{
    [[ADNClient sharedClient] muteUser:TestUserName withCompletionHandler:^(ADNUser *user, NSError *error)
    {
        [self ensureObject:user isKindOfClass:[ADNUser class]];
        STAssertTrue(user.youMuted, @"The user should now be muted.");
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_unmuteUser
{
    [[ADNClient sharedClient] unmuteUser:TestUserName withCompletionHandler:^(ADNUser *user, NSError *error)
    {
        [self ensureObject:user isKindOfClass:[ADNUser class]];
        STAssertFalse(user.youMuted, @"The user should not be muted.");
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_getUsers
{
    NSArray *usernamesOrIds = @[@1,@2,@3];
    
    [[ADNClient sharedClient] getUsers:usernamesOrIds withCompletionHandler:^(NSArray *objects, NSError *error)
    {
        [self ensureObject:objects isKindOfClass:[NSArray class]];
        [self ensureCollection:objects containsObjectsOfClass:[ADNUser class]];
        STAssertEquals(objects.count, usernamesOrIds.count, @"Array must contain %i objects. (%i)", usernamesOrIds.count, objects.count);
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_searchUsersWithQuery
{
    [[ADNClient sharedClient] searchUsersWithQuery:@"Matt" withCompletionHandler:^(NSArray *objects, NSError *error)
    {
        [self ensureObject:objects isKindOfClass:[NSArray class]];
        [self ensureCollection:objects containsObjectsOfClass:[ADNUser class]];
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_getFollowedUsersForUser
{
    [[ADNClient sharedClient] getFollowedUsersForUser:TestUserId withCompletionHandler:^(NSArray *objects, NSError *error)
    {
        [self ensureObject:objects isKindOfClass:[NSArray class]];
        [self ensureCollection:objects containsObjectsOfClass:[ADNUser class]];
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_getFollowersForUser
{
    [[ADNClient sharedClient] getFollowersForUser:TestUserId withCompletionHandler:^(NSArray *objects, NSError *error)
    {
        [self ensureObject:objects isKindOfClass:[NSArray class]];
        [self ensureCollection:objects containsObjectsOfClass:[ADNUser class]];
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_getFollowedUserIdsForUser
{
    [[ADNClient sharedClient] getFollowedUserIdsForUser:TestUserId withCompletionHandler:^(NSArray *objects, NSError *error)
    {
        [self ensureObject:objects isKindOfClass:[NSArray class]];
        [self ensureCollection:objects containsObjectsOfClass:[NSString class]];
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_getFollowerIdsForUser
{
    [[ADNClient sharedClient] getFollowerIdsForUser:TestUserId withCompletionHandler:^(NSArray *objects, NSError *error)
    {
        [self ensureObject:objects isKindOfClass:[NSArray class]];
        [self ensureCollection:objects containsObjectsOfClass:[NSString class]];
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_getMutedUsersForUser
{
    [[ADNClient sharedClient] getMutedUsersForUser:@"me" withCompletionHandler:^(NSArray *objects, NSError *error)
    {
        [self ensureObject:objects isKindOfClass:[NSArray class]];
        [self ensureCollection:objects containsObjectsOfClass:[ADNUser class]];
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_getUsersWhoRepostedPost
{
    [[ADNClient sharedClient] getUsersWhoRepostedPost:@"3" withCompletionHandler:^(NSArray *objects, NSError *error)
    {
        [self ensureObject:objects isKindOfClass:[NSArray class]];
        [self ensureCollection:objects containsObjectsOfClass:[ADNUser class]];
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

- (void)test_getUsersWhoStarredPost
{
    [[ADNClient sharedClient] getUsersWhoStarredPost:@"3" withCompletionHandler:^(NSArray *objects, NSError *error)
    {
        [self ensureObject:objects isKindOfClass:[NSArray class]];
        [self ensureCollection:objects containsObjectsOfClass:[ADNUser class]];
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

@end
