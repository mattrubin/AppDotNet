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
    NSError *error;
    if ((responseEnvelope = [ADNHelper dictionaryFromJSONData:userData error:&error])) {
        self.dataDictionary = [ADNHelper responseContentFromEnvelope:responseEnvelope error:&error];
    }
    if (error) {
        STFail(@"Cannot create data dictionary: %@", error);
    }
}

- (void)tearDown
{
    self.dataDictionary = nil;
    
    [super tearDown];
}

- (void)testMessage
{
#warning Ignoring user in message conversion test
    NSMutableDictionary *inputDictionary = [self.dataDictionary mutableCopy];
    [inputDictionary removeObjectForKey:@"user"];
    
    ADNMessage *message = [ADNMessage instanceFromDictionary:inputDictionary];
    
    NSMutableDictionary *testDictionary    = [self.dataDictionary mutableCopy];
    NSMutableDictionary *messageDictionary = [message.toDictionary mutableCopy];
    
#warning Channel validation incomplete: currently ignoring owner object
    [testDictionary removeObjectForKey:@"user"];
    [messageDictionary removeObjectForKey:@"user"];

    if (![messageDictionary isEqual:testDictionary]) {
        STFail(@"Message dictionary validation failed.");
        NSLog(@"A:\n%@", testDictionary);
        NSLog(@"B:\n%@", messageDictionary);
    }
}

@end
