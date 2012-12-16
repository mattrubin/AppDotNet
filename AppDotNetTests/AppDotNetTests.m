//
//  AppDotNetTests.m
//  AppDotNetTests
//
//  Created by Me on 12/14/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "AppDotNetTests.h"

#import "ADN.h"

@implementation AppDotNetTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testUsers
{
    NSLog(@"==================================================");
    [ADN getCurrentUserWithCompletionHandler:nil];
    NSLog(@"==================================================");
    [ADN getUserWithID:1 completionHandler:nil];
    NSLog(@"==================================================");
    [ADN getUserWithUsername:@"dalton" completionHandler:nil];
    NSLog(@"==================================================");
    [ADN getUserWithUsername:@"@dalton" completionHandler:nil];
    NSLog(@"==================================================");
}

@end
