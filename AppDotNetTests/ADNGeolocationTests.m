//
//  ADNGeolocationTests.m
//  AppDotNet
//
//  Created by Thomas Westfeld on 15.03.13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNGeolocationTests.h"
#import <AppDotNet/AppDotNet.h>
#import <CoreLocation/CoreLocation.h>
#import "SenTestCase+ADNModelTests.h"

@interface ADNGeolocationTests ()

@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, strong) ADNGeolocation *geoloc;

@end

@implementation ADNGeolocationTests

- (void) setUp
{
    // set up a sample (CLLocation *)location and a (ADNGeolocation *) geoloc from
    // JSON mock data
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:@"Geolocation" ofType:@"json"];
    NSData *testData = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    NSDictionary *testDictionary = [NSJSONSerialization JSONObjectWithData:testData options:0 error:&error];
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake([(NSNumber *)testDictionary[@"value"][@"latitude"] floatValue], [(NSNumber *)testDictionary[@"value"][@"longitude"] floatValue]);
    self.location = [[CLLocation alloc] initWithCoordinate:coord altitude:[(NSNumber *)testDictionary[@"value"][@"altitude"] floatValue] horizontalAccuracy:[(NSNumber *)testDictionary[@"value"][@"horizontal_accuracy"] floatValue] verticalAccuracy:[(NSNumber *)testDictionary[@"value"][@"vertical_accuracy"] floatValue] timestamp:[NSDate date]];
    self.geoloc = [ADNJSONAdapter modelOfClass:[ADNGeolocation class] fromJSONDictionary:testDictionary error:nil];
}


- (void)testGeolocationAnnotation
{
    [self roundTripEqualityTestforModelClass:[ADNGeolocation class] withJSONNamed:@"Geolocation"];
}

- (void)location:(CLLocation*) loc equals:(ADNGeolocation *)adnGeo messagePrefix:(NSString *)prefix
{
    STAssertEquals(loc.coordinate.latitude, adnGeo.latitude, [NSString stringWithFormat:@"%@ latitude  not in agreement with CoreLocation location object", prefix]);
    STAssertEquals(loc.coordinate.longitude, adnGeo.longitude, [NSString stringWithFormat:@"%@ latitude  not in agreement with CoreLocation location object", prefix]);
    STAssertEquals(loc.altitude, adnGeo.altitude, [NSString stringWithFormat:@"%@ latitude  not in agreement with CoreLocation location object", prefix]);
    STAssertEquals(loc.horizontalAccuracy, adnGeo.horizontalAccuracy, [NSString stringWithFormat:@"%@ latitude  not in agreement with CoreLocation location object", prefix]);
    STAssertEquals(loc.verticalAccuracy, adnGeo.verticalAccuracy, [NSString stringWithFormat:@"%@ latitude  not in agreement with CoreLocation location object", prefix]);
}

#pragma mark Bridging method to and from CoreLocation

- (void)testCreationFromCoreLocation
{
    ADNGeolocation *geoloc = [ADNGeolocation instanceFromCoreLocation:self.location];
    [self location:self.location equals:geoloc messagePrefix:@"Create ADNGeo from CLLocation:"];
}

- (void)testOutputToCoreLocation
{
    CLLocation *location = [self.geoloc toCoreLocation];
    [self location:location equals:self.geoloc messagePrefix:@"Creation of CLLocation from ADNGeolocation:"];
}


- (void)testSetAttributesFromCoreLocation
{
    ADNGeolocation *geoloc = [[ADNGeolocation alloc] init];
    [geoloc setAttributesFromCoreLocation:self.location];
        [self location:self.location equals:geoloc messagePrefix:@"Setting Attributes of CLLocation to ADNGeolocation:"];
}
@end
