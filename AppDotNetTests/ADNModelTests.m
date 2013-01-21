//
//  ADNModelTests.m
//  AppDotNet
//
//  Created by Me on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNModelTests.h"
#import <AppDotNet/AppDotNet.h>


#define CHANNEL_TEST_FILE @"Channel"
#define MESSAGE_TEST_FILE @"Message"
#define USER_TEST_FILE @"User"


@implementation ADNModelTests

- (void)testChannel
{
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:CHANNEL_TEST_FILE ofType:@"json"];
    NSData *userData = [NSData dataWithContentsOfFile:path];
    
    NSError *error;
    self.dataDictionary = [NSJSONSerialization JSONObjectWithData:userData options:0 error:&error];
    
    
    ADNChannel *channel = [ADNChannel modelWithExternalRepresentation:self.dataDictionary];
    
    NSDictionary *testDictionary    = self.dataDictionary;
    NSDictionary *channelDictionary = channel.externalRepresentation;
    
    if (![channelDictionary isEqualToDictionary:testDictionary]) {
        STFail(@"Channel dictionary validation failed.");
        NSLog(@"A:\n%@", testDictionary);
        NSLog(@"B:\n%@", channelDictionary);
    }
    
    
    self.dataDictionary = nil;
}

- (void)testMessage
{
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:MESSAGE_TEST_FILE ofType:@"json"];
    NSData *userData = [NSData dataWithContentsOfFile:path];
    
    NSError *error;
    self.dataDictionary = [NSJSONSerialization JSONObjectWithData:userData options:0 error:&error];
    
    
    ADNMessage *message = [ADNMessage modelWithExternalRepresentation:self.dataDictionary];
    
    NSDictionary *testDictionary    = self.dataDictionary;
    NSDictionary *messageDictionary = message.externalRepresentation;
    
    if (![messageDictionary isEqual:testDictionary]) {
        STFail(@"Message dictionary validation failed.");
        NSLog(@"A:\n%@", testDictionary);
        NSLog(@"B:\n%@", messageDictionary);
    }
    
    
    self.dataDictionary = nil;
}

- (void)testUser
{
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:USER_TEST_FILE ofType:@"json"];
    NSData *userData = [NSData dataWithContentsOfFile:path];
    
    NSError *error;
    self.dataDictionary = [NSJSONSerialization JSONObjectWithData:userData options:0 error:&error];
    
    
    ADNUser *user = [ADNUser modelWithExternalRepresentation:self.dataDictionary];
    
    if (![user.externalRepresentation isEqual:self.dataDictionary]) {
        STFail(@"Message dictionary validation failed.");
        NSLog(@"A:\n%@", self.dataDictionary);
        NSLog(@"B:\n%@", user.externalRepresentation);
    }
    
    
    self.dataDictionary = nil;
}


@end
