//
//  ADNMessageTests.m
//  AppDotNet
//
//  Created by Me on 12/24/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNMessageTests.h"
#import "ADNHelper.h"
#import "ADNMessage.h"

#define TEST_FILE @"Message"


@implementation ADNMessageTests

- (void)setUp
{
    [super setUp];
    
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:TEST_FILE ofType:@"json"];
    NSData *userData = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *responseEnvelope;
    if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:userData error:nil])) {
        self.dataDictionary = [ADNHelper responseContentFromEnvelope:responseEnvelope error:nil];
    }
}

- (void)tearDown
{
    self.dataDictionary = nil;
    
    [super tearDown];
}

- (void)testMessage
{
    ADNMessage *message = [ADNMessage instanceFromDictionary:self.dataDictionary];
    
    NSMutableDictionary *testDictionary    = [self.dataDictionary mutableCopy];
    NSMutableDictionary *messageDictionary = [message.toDictionary mutableCopy];
    
    if (![messageDictionary isEqual:testDictionary]) {
        STFail(@"Message dictionary validation failed.");
        NSLog(@"A:\n%@", testDictionary);
        NSLog(@"B:\n%@", messageDictionary);
    }
}

@end
