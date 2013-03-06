//
//  ADNParameters.h
//  AppDotNet
//
//  Created by Matt Rubin on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//


// http://developers.app.net/docs/meta/annotations/#retrieving

extern NSString * const ADNParameterIncludeAnnotations;
extern NSString * const ADNParameterIncludeUserAnnotations;
extern NSString * const ADNParameterIncludePostAnnotations;
extern NSString * const ADNParameterIncludeChannelAnnotations;
extern NSString * const ADNParameterIncludeMessageAnnotations;


// http://developers.app.net/docs/basics/pagination/#parameters

extern NSString * const ADNParameterSinceId;
extern NSString * const ADNParameterBeforeId;
extern NSString * const ADNParameterCount;


// http://developers.app.net/docs/basics/pagination/#special-pagination-ids

extern NSString * const ADNPaginationIdLastRead;
extern NSString * const ADNPaginationIdLastReadInclusive;
extern NSString * const ADNPaginationIdMarker;
extern NSString * const ADNPaginationIdMarkerInclusive;
