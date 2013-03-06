//
//  ADNParameters.m
//  AppDotNet
//
//  Created by Matt Rubin on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNParameters.h"


NSString * const ADNParameterIncludeAnnotations        = @"include_annotations";
NSString * const ADNParameterIncludeUserAnnotations    = @"include_user_annotations";
NSString * const ADNParameterIncludePostAnnotations    = @"include_post_annotations";
NSString * const ADNParameterIncludeChannelAnnotations = @"include_channel_annotations";
NSString * const ADNParameterIncludeMessageAnnotations = @"include_message_annotations";


NSString * const ADNParameterSinceId  = @"since_id";
NSString * const ADNParameterBeforeId = @"before_id";
NSString * const ADNParameterCount    = @"count";


NSString * const ADNPaginationIdLastRead          = @"last_read";
NSString * const ADNPaginationIdLastReadInclusive = @"last_read_inclusive";
NSString * const ADNPaginationIdMarker            = @"marker";
NSString * const ADNPaginationIdMarkerInclusive   = @"marker_inclusive";