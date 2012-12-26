//
//  ADNGeolocation.h
//  AppDotNet
//
//  Created by Me on 12/25/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNAnnotation.h"
#import <CoreLocation/CoreLocation.h>


@interface ADNGeolocation : ADNAnnotation

@property (nonatomic, assign) CLLocationDegrees  latitude;
@property (nonatomic, assign) CLLocationDegrees  longitude;
@property (nonatomic, assign) CLLocationDistance altitude;
@property (nonatomic, assign) CLLocationAccuracy horizontalAccuracy;
@property (nonatomic, assign) CLLocationAccuracy verticalAccuracy;

+ (id)instanceFromCoreLocation:(CLLocation *)location;
- (void)setAttributesFromCoreLocation:(CLLocation *)location;

- (CLLocation *)toCoreLocation;

@end
