//
//  ADNClient+ADNFile.m
//  AppDotNet
//
//  Created by Matt Rubin on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient+ADNFile.h"


NSString * const ADNFileParameterFileTypes              = @"file_types";
NSString * const ADNFileParameterIncludeIncomplete      = @"include_incomplete";
NSString * const ADNFileParameterIncludeAnnotations     = @"include_annotations";
NSString * const ADNFileParameterIncludeFileAnnotations = @"include_file_annotations";
NSString * const ADNFileParameterIncludeUserAnnotations = @"include_user_annotations";


@interface ADNClient (ADNFileInternal)

- (void)createFileNamed:(NSString *)fileName withContent:(NSData *)fileData mimeType:(NSString *)mimeType fileURL:(NSURL *)fileURL metadata:(NSDictionary *)metadata completionHandler:(ADNFileCompletionHandler)handler;

@end


@implementation ADNClient (ADNFile)

/**
 * Create a File
 * POST /stream/0/files
 * http://developers.app.net/docs/resources/file/lifecycle/#create-a-file
 */
- (void)createFileNamed:(NSString *)fileName withContent:(NSData *)fileData mimeType:(NSString *)mimeType metadata:(NSDictionary *)metadata completionHandler:(ADNFileCompletionHandler)handler
{
	[self createFileNamed:fileName withContent:fileData mimeType:mimeType fileURL:nil metadata:metadata completionHandler:handler];
}

- (void)createFileWithContentsOfURL:(NSURL *)URL metadata:(NSDictionary *)metadata completionHandler:(ADNFileCompletionHandler)handler
{
	[self createFileNamed:nil withContent:nil mimeType:nil fileURL:URL metadata:metadata completionHandler:handler];
}

- (void)createFileNamed:(NSString *)fileName withContent:(NSData *)fileData mimeType:(NSString *)mimeType fileURL:(NSURL *)fileURL metadata:(NSDictionary *)metadata completionHandler:(ADNFileCompletionHandler)handler
{
	NSURLRequest *request = [self multipartFormRequestWithMethod:@"POST" path:@"files" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
		if (fileData) {
			[formData appendPartWithFileData:fileData name:@"content" fileName:fileName mimeType:mimeType];
		} else if (fileURL) {
			[formData appendPartWithFileURL:fileURL name:@"content" error:nil];
		}
		
		if (metadata.count > 0) {
			// TODO: figure out what to do with error from json serialization
			[formData appendPartWithFileData:[NSJSONSerialization dataWithJSONObject:metadata options:0 error:nil] name:@"metadata" fileName:@"metadata.json" mimeType:@"application/json"];
		}
	}];
	
	AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:[self successBlockForModelOfClass:[ADNFile class] withHandler:handler] failure:[self failureBlockForHandler:handler]];
    [self enqueueHTTPRequestOperation:operation];
}


/**
 * Retrieve a File
 * GET /stream/0/files/[file_id]
 * http://developers.app.net/docs/resources/file/lookup/#retrieve-a-file
 */
- (void)getFile:(NSString *)fileId withCompletionHandler:(ADNFileCompletionHandler)handler
{
    NSString *endpoint = [@"files/" stringByAppendingString:fileId];
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForModelOfClass:[ADNFile class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

/**
 * Retrieve multiple Files
 * GET /stream/0/files
 * http://developers.app.net/docs/resources/file/lookup/#retrieve-multiple-files
 */
- (void)getFiles:(NSArray *)fileIds withCompletionHandler:(NSArrayCompletionHandler)handler
{
    NSString *endpoint = [NSString stringWithFormat:@"files?ids=%@", [fileIds componentsJoinedByString:@","]];
    
    [self getPath:endpoint
       parameters:nil
          success:[self successBlockForArrayofModelsOfClass:[ADNFile class] withHandler:handler]
          failure:[self failureBlockForHandler:handler]];
}

/**
 * Delete a File
 * DELETE /stream/0/files/[file_id]
 * http://developers.app.net/docs/resources/file/lifecycle/#delete-a-file
 */
- (void)deleteFile:(NSString *)fileId withCompletionHandler:(ADNFileCompletionHandler)handler
{
    NSString *endpoint = [@"files/" stringByAppendingString:fileId];
    
    [self deletePath:endpoint
          parameters:nil
             success:[self successBlockForModelOfClass:[ADNFile class] withHandler:handler]
             failure:[self failureBlockForHandler:handler]];
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
#warning API call not implemented
}

/**
 * Set File content
 * PUT /stream/0/files/[file_id]/content
 * http://developers.app.net/docs/resources/file/content/#set-file-content
 */
- (void)setContent:(NSData *)fileData forFile:(NSString *)fileId withCompletionHandler:(ADNFileCompletionHandler)handler
{
#warning API call not implemented
}

@end
