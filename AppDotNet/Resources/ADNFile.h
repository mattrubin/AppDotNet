//
//  ADNFile.h
//  AppDotNet
//
//  Created by Me on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"
#import "ADNAnnotationCollection.h"
#import "ADNDerivedFile.h"
#import "ADNSource.h"
#import "ADNUser.h"


/**
 * A file uploaded by a User and hosted by App.net.
 */
@interface ADNFile : ADNModel

/// Metadata about the File. See the Annotations documentation.
@property (nonatomic, strong) ADNAnnotationCollection *annotations;

/// Is this File considered complete? A File is complete once its contents are set.
@property (nonatomic, assign, getter = isComplete) BOOL complete;

/// An object containing any other Files that were created using this File as input.
/// Please see the section on derived Files for more information.
@property (nonatomic, strong) NSDictionary *derivedFiles;

/// A token that can be used to access or modify a File.
/// Please see the section on File authorization for more information.
@property (nonatomic, copy) NSString *fileToken;

/// Primary identifier for a File.
/// This will be an integer, but it is always expressed as a string to avoid
/// limitations with the way JavaScript integers are expressed.
@property (nonatomic, copy) NSString *fileId;

/// In broad terms, what kind of File is this? It can be user specified
/// or it will be automatically guessed based on the File's mime_type.
/// Must be one of: image, or other.
@property (nonatomic, copy) NSString *kind;

/// The user provided MIME type of the file.
@property (nonatomic, copy) NSString *mimeType;

/// The user provided name of the File.
@property (nonatomic, copy) NSString *name;

/// A SHA1 hash of the File contents.
@property (nonatomic, copy) NSString *sha1;

/// The number of bytes of the file's contents.
@property (nonatomic, assign) NSUInteger size;

/// The API consumer that created this File.
@property (nonatomic, strong) ADNSource *source;

/// The total number of bytes of the File's contents including all derived Files.
@property (nonatomic, assign) NSUInteger totalSize;

/// A string that looks like a reversed domain name to identify the intended purpose
/// of this File. There is no authentication or authorization performed on this
/// field. Just because you create Files with the type com.example.awesome does
/// not imply you are the only one that is using that namespace or that the File
/// contents will match the format you expect. net.app.core is a reserved namespace.
@property (nonatomic, copy) NSString *type;

/// The full URL to this File. It may return a 404 if the File has been deleted
/// or if the URL has expired.
@property (nonatomic, copy) NSURL *url;

/// A date and time indicating when the provided url will no longer be valid.
/// If the expiration has passed, please refetch the File or underlying object
/// to get a new URL to use.
@property (nonatomic, copy) NSDate *urlExpires;

/// The User who created this file.
@property (nonatomic, strong) ADNUser *user;

@end
