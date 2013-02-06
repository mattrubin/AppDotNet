//
//  ADNDerivedFile.h
//  AppDotNet
//
//  Created by Me on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNModel.h"


extern NSString * const ADNDerivedFileKeyImageThumb200s;
extern NSString * const ADNDerivedFileKeyImageThumb960r;


@interface ADNDerivedFile : ADNModel

/// The user provided MIME type of the file.
@property (nonatomic, copy) NSString *mimeType;

/// A SHA1 hash of the File contents.
@property (nonatomic, copy) NSString *sha1;

/// The number of bytes of the file's contents.
@property (nonatomic, assign) NSUInteger size;

/// The full URL to this File. It may return a 404 if the File has been deleted
/// or if the URL has expired.
@property (nonatomic, copy) NSURL *url;

/// A date and time indicating when the provided url will no longer be valid.
/// If the expiration has passed, please refetch the File or underlying object
/// to get a new URL to use.
@property (nonatomic, copy) NSDate *urlExpires;

@end
