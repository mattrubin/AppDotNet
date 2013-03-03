//
//  APITests.m
//  AppDotNet
//
//  Created by Matt Rubin on 1/22/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "APITests.h"
#import <AppDotNet/ADNClient.h>


NSString * const TestAccessToken = @"";


@implementation APITests

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

@end
