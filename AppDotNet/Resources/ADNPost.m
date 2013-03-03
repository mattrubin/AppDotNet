//
//  ADNPost.m
//  AppDotNet
//
//  Created by Me on 12/14/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNPost.h"


@implementation ADNPost

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [super.JSONKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"postId": ADNFieldId,
            @"createdAt": ADNFieldCreatedAt,
            @"replyToId": ADNFieldReplyTo,
            @"canonicalURL": ADNFieldCanonicalURL,
            @"threadId": ADNFieldThreadId,
            @"numReplies": ADNFieldNumReplies,
            @"numStars": ADNFieldNumStars,
            @"numReposts": ADNFieldNumReposts,
            @"isDeleted": ADNFieldIsDeleted,
            @"machineOnly": ADNFieldMachineOnly,
            @"youStarred": ADNFieldYouStarred,
            @"starredBy": ADNFieldStarredBy,
            @"youReposted": ADNFieldYouReposted,
            @"repostOf": ADNFieldRepostOf,
            @"annotations": ADNFieldAnnotations
            }];
}


#pragma mark Transformers

+ (NSValueTransformer *)annotationsJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:ADNAnnotationArrayValueTransformerName];
}

+ (NSValueTransformer *)createdAtJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:ADNDateValueTransformerName];
}

@end
