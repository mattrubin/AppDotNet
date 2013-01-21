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
#import "ADNResponseEnvelope.h"

#define CHANNEL_TEST_FILE @"Channel"


@implementation ADNChannelTests

- (void)setUp
{
    [super setUp];
    
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:CHANNEL_TEST_FILE ofType:@"json"];
    NSData *userData = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *responseDictionary;
    if ((responseDictionary = [ADNHelper dictionaryFromJSONData:userData error:nil])) {
        ADNResponseEnvelope *responseEnvelope = [ADNResponseEnvelope modelWithExternalRepresentation:responseDictionary];
        self.dataDictionary = responseEnvelope.data;
    }
}

- (void)tearDown
{
    self.dataDictionary = nil;
    
    [super tearDown];
}

- (void)testChannel
{
    ADNChannel *channel = [ADNChannel modelWithExternalRepresentation:self.dataDictionary];
    
    NSDictionary *testDictionary    = self.dataDictionary;
    NSDictionary *channelDictionary = channel.externalRepresentation;
    
    if (![channelDictionary isEqualToDictionary:testDictionary]) {
        STFail(@"Channel dictionary validation failed.");
        NSLog(@"A:\n%@", testDictionary);
        NSLog(@"B:\n%@", channelDictionary);
    }
}

@end
