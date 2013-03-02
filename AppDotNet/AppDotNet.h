//
//  AppDotNet.h
//  AppDotNet
//
//  Created by Me on 12/14/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED

#import <AppDotNet/ADNClient.h>
#import <AppDotNet/ADNClient+ADNUser.h>
#import <AppDotNet/ADNClient+ADNPost.h>
#import <AppDotNet/ADNClient+ADNChannel.h>
#import <AppDotNet/ADNClient+ADNMessage.h>
#import <AppDotNet/ADNClient+ADNFile.h>
#import <AppDotNet/ADNClient+ADNStream.h>
#import <AppDotNet/ADNClient+ADNFilter.h>
#import <AppDotNet/ADNClient+ADNInteraction.h>
#import <AppDotNet/ADNClient+ADNStreamMarker.h>
#import <AppDotNet/ADNClient+ADNText.h>
#import <AppDotNet/ADNClient+ADNToken.h>

#import <AppDotNet/ADNAuthenticationRequest.h>
#import <AppDotNet/ADNMetadata.h>

#import <AppDotNet/ADNUser.h>
#import <AppDotNet/ADNPost.h>
#import <AppDotNet/ADNChannel.h>
#import <AppDotNet/ADNMessage.h>
#import <AppDotNet/ADNFile.h>
#import <AppDotNet/ADNStream.h>
#import <AppDotNet/ADNFilter.h>
#import <AppDotNet/ADNInteraction.h>
#import <AppDotNet/ADNStreamMarker.h>
#import <AppDotNet/ADNToken.h>

#else

#import "ADNClient.h"
#import "ADNClient+ADNUser.h"
#import "ADNClient+ADNPost.h"
#import "ADNClient+ADNChannel.h"
#import "ADNClient+ADNMessage.h"
#import "ADNClient+ADNFile.h"
#import "ADNClient+ADNStream.h"
#import "ADNClient+ADNFilter.h"
#import "ADNClient+ADNInteraction.h"
#import "ADNClient+ADNStreamMarker.h"
#import "ADNClient+ADNText.h"
#import "ADNClient+ADNToken.h"

#import "ADNAuthenticationRequest.h"
#import "ADNMetadata.h"

#import "ADNUser.h"
#import "ADNPost.h"
#import "ADNChannel.h"
#import "ADNMessage.h"
#import "ADNFile.h"
#import "ADNStream.h"
#import "ADNFilter.h"
#import "ADNInteraction.h"
#import "ADNStreamMarker.h"
#import "ADNToken.h"

#endif