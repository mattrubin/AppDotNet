//
//  ADNFileOembedAnnotationTests.m
//  AppDotNet
//
//  Created by Thomas Westfeld on 16.03.13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNFileOembedAnnotationTests.h"
#import <AppDotNet/AppDotNet.h>
#import "SenTestCase+ADNModelTests.h"

@interface ADNFileOembedAnnotationTests ()

@property (nonatomic, strong) ADNFileOembedAnnotation *annotation;
@property (nonatomic, strong) NSDictionary *mockData;
@property (nonatomic, strong) ADNFile *file;

@end


@implementation ADNFileOembedAnnotationTests

- (void) setUp
{
    // set up a sample (ADNFileOembedAnnotation *) annotation from
    // JSON mock data
    NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:@"FileOembedAnnotation" ofType:@"json"];
    NSData *testData = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    NSDictionary *testDictionary = [NSJSONSerialization JSONObjectWithData:testData options:0 error:&error];
    self.mockData = testDictionary;
    NSAssert(error == nil, @"could not read JSON mock data");
    path = [[NSBundle bundleForClass:self.class] pathForResource:@"File" ofType:@"json"];
    testData = [NSData dataWithContentsOfFile:path];
    error = nil;
    testDictionary = [NSJSONSerialization JSONObjectWithData:testData options:0 error:&error];
    self.file = [ADNJSONAdapter modelOfClass:[ADNFile class] fromJSONDictionary:testDictionary error:nil];
    self.annotation = [[ADNFileOembedAnnotation alloc] init];
}

- (void) tearDown
{
    self.file = nil;
    self.annotation = nil;
    self.mockData = nil;
}

- (void)testCreatingMockData
{
    STAssertNotNil(self.mockData, @"JSON mock data was not properly read in");
}

- (void)testCreationWithFile
{
    self.annotation.file = self.file;
    NSDictionary *annotationDict = [ADNJSONAdapter JSONDictionaryFromModel:self.annotation];
    STAssertEqualObjects(annotationDict, self.mockData, @"Annotation creation from file failed");
}

- (void)testConvinienceConstructorWithFile
{
    self.annotation = [ADNFileOembedAnnotation instanceFromFile:self.file];
    NSDictionary *annotationDict = [ADNJSONAdapter JSONDictionaryFromModel:self.annotation];
    STAssertEqualObjects(annotationDict, self.mockData, @"Annotation creation with convinience constructor from file failed");
}

@end
