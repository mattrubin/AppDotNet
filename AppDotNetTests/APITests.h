//
//  APITests.h
//  AppDotNet
//
//  Created by Me on 1/22/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

// Tests of the App.net API methods
// This test case is not currently included in AppDotNetTests

@interface APITests : SenTestCase

@property (nonatomic, strong) dispatch_semaphore_t semaphore;

- (void)ensureObject:(id)object isKindOfClass:(Class)class;
- (void)ensureCollection:(id <NSFastEnumeration>)collection containsObjectsOfClass:(Class)class;

@end
