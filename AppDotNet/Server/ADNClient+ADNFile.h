//
//  ADNClient+ADNFile.h
//  AppDotNet
//
//  Created by Matt Rubin on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient.h"
#import "ADNFile.h"


extern NSString * const ADNFileParameterFileTypes;
extern NSString * const ADNFileParameterIncludeIncomplete;
extern NSString * const ADNFileParameterIncludeAnnotations;
extern NSString * const ADNFileParameterIncludeFileAnnotations;
extern NSString * const ADNFileParameterIncludeUserAnnotations;


@interface ADNClient (ADNFile)

// Create a File
- (void)createFile:(ADNFile *)file withCompletionHandler:(ADNFileCompletionHandler)handler;
// - (void)createFile:(ADNFile *)file withContent:(NSData *)fileData completionHandler:(ADNFileCompletionHandler)handler;

// Retrieve a File
- (void)getFile:(NSString *)fileId withCompletionHandler:(ADNFileCompletionHandler)handler;

// Retrieve multiple Files
- (void)getFiles:(NSArray *)fileIds withCompletionHandler:(NSArrayCompletionHandler)handler;

// Delete a File
- (void)deleteFile:(NSString *)fileId withCompletionHandler:(ADNFileCompletionHandler)handler;

// Retrieve my Files
- (void)getMyFilesWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler;

// Update a File
- (void)updateFile:(ADNFile *)file withCompletionHandler:(ADNFileCompletionHandler)handler;

// Set File content
- (void)setContent:(NSData *)fileData forFile:(NSString *)fileId withCompletionHandler:(ADNFileCompletionHandler)handler;

@end
