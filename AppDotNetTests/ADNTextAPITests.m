//
//  ADNTextAPITests.m
//  AppDotNet
//
//  Created by Me on 1/22/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNTextAPITests.h"
#import <AppDotNet/ADNClient+ADNText.h>


NSString * const TestText = @"This is a test. #hashtag @dalton link.com";


@implementation ADNTextAPITests

- (void)test_processText
{
    [[ADNClient sharedClient] processText:TestText withCompletionHandler:^(ADNText *text, ADNMetadata *meta, NSError *error) {
        [self ensureObject:text isKindOfClass:[ADNText class]];
        STAssertEqualObjects(text.text, TestText, @"The text object should contain the processed text");
        
        dispatch_semaphore_signal(self.semaphore);
    }];
}

@end
