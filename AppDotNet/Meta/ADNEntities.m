//
//  ADNEntities.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNEntities.h"


@implementation ADNEntities

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@:\n   mentions: %@\n   hashtags: %@\n   links: %@\n]", self.class, self.mentions, self.hashtags, self.links];
}


#pragma mark Transformers

+ (NSValueTransformer *)hashtagsTransformer
{
    return [ADNHashtag transformerForArrayOfClass];
}

+ (NSValueTransformer *)linksTransformer
{
    return [ADNLink transformerForArrayOfClass];
}

+ (NSValueTransformer *)mentionsTransformer
{
    return [ADNMention transformerForArrayOfClass];
}

@end
