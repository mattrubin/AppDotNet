//
//  ADNSource.h
//  AppDotNet
//
//  Created by Matt Rubin on 12/23/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNObject.h"


@interface ADNSource : ADNObject

@property (nonatomic, copy) NSString *clientID;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *name;

@end
