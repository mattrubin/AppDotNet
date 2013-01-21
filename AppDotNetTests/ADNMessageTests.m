//
//  ADNMessageTests.m
//  AppDotNet
//
//  Created by Me on 12/24/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNMessageTests.h"
#import "ADNHelper.h"
#import "ADNResponseEnvelope.h"
#import "ADNMessage.h"

#define TEST_FILE @"Message"


@implementation ADNMessageTests

- (void)setUp
{
    [super setUp];
    
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:TEST_FILE ofType:@"json"];
    NSData *userData = [NSData dataWithContentsOfFile:path];
    
    NSError *error;
    self.dataDictionary = [NSJSONSerialization JSONObjectWithData:userData options:0 error:&error];
}

- (void)tearDown
{
    self.dataDictionary = nil;
    
    [super tearDown];
}

- (void)testMessage
{
    ADNMessage *message = [ADNMessage modelWithExternalRepresentation:self.dataDictionary];
    
    NSDictionary *testDictionary    = self.dataDictionary;
    NSDictionary *messageDictionary = message.externalRepresentation;
    
    if (![messageDictionary isEqual:testDictionary]) {
        STFail(@"Message dictionary validation failed.");
        NSLog(@"A:\n%@", testDictionary);
        NSLog(@"B:\n%@", messageDictionary);
    }
}

@end
