//
//  ADNModelTests.m
//  AppDotNet
//
//  Created by Matt Rubin on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNModelTests.h"
#import <AppDotNet/AppDotNet.h>
#import "SenTestCase+ADNModelTests.h"

@implementation ADNModelTests

#pragma mark Tests

- (void)testChannel
{
    [self roundTripEqualityTestforModelClass:[ADNChannel class] withJSONNamed:@"Channel"];
}

- (void)testMessage
{
    [self roundTripEqualityTestforModelClass:[ADNMessage class] withJSONNamed:@"Message"];
}

- (void)testUser
{
    [self roundTripEqualityTestforModelClass:[ADNUser class] withJSONNamed:@"User"];
}

- (void)testPost
{
    [self roundTripEqualityTestforModelClass:[ADNPost class] withJSONNamed:@"Post"];
}

- (void)testFile
{
    [self roundTripEqualityTestforModelClass:[ADNFile class] withJSONNamed:@"File"];
}

- (void)testToken
{
    [self roundTripEqualityTestforModelClass:[ADNToken class] withJSONNamed:@"Token"];
}

@end
