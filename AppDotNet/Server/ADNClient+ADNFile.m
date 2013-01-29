//
//  ADNClient+ADNFile.m
//  AppDotNet
//
//  Created by Me on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient+ADNFile.h"


NSString * const ADNFileParameterFileTypes              = @"file_types";
NSString * const ADNFileParameterIncludeIncomplete      = @"include_incomplete";
NSString * const ADNFileParameterIncludeAnnotations     = @"include_annotations";
NSString * const ADNFileParameterIncludeFileAnnotations = @"include_file_annotations";
NSString * const ADNFileParameterIncludeUserAnnotations = @"include_user_annotations";


@implementation ADNClient (ADNFile)

/**
 * Create a File
 * POST /stream/0/files
 * http://developers.app.net/docs/resources/file/lifecycle/#create-a-file
 */
- (void)createFile:(ADNFile *)file withCompletionHandler:(ADNFileCompletionHandler)handler
{
    
}

/**
 * Retrieve a File
 * GET /stream/0/files/[file_id]
 * http://developers.app.net/docs/resources/file/lookup/#retrieve-a-file
 */
- (void)getFile:(NSString *)fileId withCompletionHandler:(ADNFileCompletionHandler)handler
{
    
}

/**
 * Retrieve multiple Files
 * GET /stream/0/files
 * http://developers.app.net/docs/resources/file/lookup/#retrieve-multiple-files
 */
- (void)getFiles:(NSArray *)fileIds withCompletionHandler:(NSArrayCompletionHandler)handler
{
    
}

/**
 * Delete a File
 * DELETE /stream/0/files/[file_id]
 * http://developers.app.net/docs/resources/file/lifecycle/#delete-a-file
 */
- (void)deleteFile:(NSString *)fileId withCompletionHandler:(ADNFileCompletionHandler)handler
{
    
}

/**
 * Retrieve my Files
 * GET /stream/0/users/me/files
 * http://developers.app.net/docs/resources/file/lookup/#retrieve-my-files
 */
- (void)getMyFilesWithParameters:(NSDictionary *)parameters completionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = @"users/me/files";
    
    [self getPath:endpoint
       parameters:parameters
          success:[self successBlockForArrayofModelsOfClass:[ADNFile class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

/**
 * Update a File
 * PUT /stream/0/files/[file_id]
 * http://developers.app.net/docs/resources/file/lifecycle/#update-a-file
 */
- (void)updateFile:(ADNFile *)file withCompletionHandler:(ADNFileCompletionHandler)handler
{
    
}

/**
 * Set File content
 * PUT /stream/0/files/[file_id]/content
 * http://developers.app.net/docs/resources/file/content/#set-file-content
 */
- (void)setContent:(NSData *)fileData forFile:(NSString *)fileId withCompletionHandler:(ADNFileCompletionHandler)handler
{
    
}

@end
