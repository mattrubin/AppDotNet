//
//  ADNChannelTests.m
//  AppDotNet
//
//  Created by Me on 12/20/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNChannelTests.h"
#import "ADNHelper.h"
#import "ADNChannel.h"

#define CHANNEL_TEST_FILE @"Channel"


@implementation ADNChannelTests

- (void)setUp
{
    [super setUp];
    
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:CHANNEL_TEST_FILE ofType:@"json"];
    NSData *userData = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *responseEnvelope;
    if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:userData])) {
        self.dataDictionary = [ADNHelper responseContentFromEnvelope:responseEnvelope];
    }
}

- (void)tearDown
{
    self.dataDictionary = nil;
    
    [super tearDown];
}

- (void)testChannel
{
    ADNChannel *channel = [ADNChannel instanceFromDictionary:self.dataDictionary];
    
    NSMutableDictionary *testDictionary = [self.dataDictionary mutableCopy];
    
#warning Channel validation incomplete: currently ignoring owner object
    [testDictionary removeObjectForKey:@"owner"];
    
    if (![channel.toDictionary isEqualToDictionary:testDictionary]) {
        STFail(@"Channel dictionary validation failed.");
        NSLog(@"A:\n%@", testDictionary);
        NSLog(@"B:\n%@", channel.toDictionary);
    }
}

@end
