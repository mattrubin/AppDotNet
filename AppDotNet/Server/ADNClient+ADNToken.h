//
//  ADNClient+ADNToken.h
//  AppDotNet
//
//  Created by Matt Rubin on 1/21/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "ADNClient.h"
#import "ADNToken.h"


@interface ADNClient (ADNToken)

- (void)getTokenWithParameters:(NSDictionary *)parameters completionHandler:(ADNTokenCompletionHandler)handler;

@end
