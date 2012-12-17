//
//  AppDotNetTests.m
//  AppDotNetTests
//
//  Created by Me on 12/14/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "AppDotNetTests.h"

#import "ADN.h"
#import "ADNHelper.h"

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
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:@"User" ofType:@"json"];
    NSData *userData = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *responseEnvelope;
    NSDictionary *userDictionary;
    if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:userData])) {
        userDictionary = [ADNHelper responseDataFromEnvelope:responseEnvelope];
    }
    if (!userDictionary) return;
    
    [ADNUser userFromDictionary:userDictionary];
    
    /*
    NSLog(@"==================================================");
    [ADN getCurrentUserWithCompletionHandler:nil];
    NSLog(@"==================================================");
    [ADN getUserWithID:3 completionHandler:nil];
    NSLog(@"==================================================");
    [ADN getUserWithUsername:@"dalton" completionHandler:nil];
    NSLog(@"==================================================");
    [ADN getUserWithUsername:@"@berg" completionHandler:nil];
    NSLog(@"==================================================");
    */
}

@end
