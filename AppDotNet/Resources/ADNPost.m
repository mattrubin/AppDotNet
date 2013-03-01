//
//  ADNPost.m
//  AppDotNet
//
//  Created by Me on 12/14/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNPost.h"


@implementation ADNPost

- (id)init
{
    self = [super init];
    if (self) {
        self.annotations = [ADNAnnotationCollection new];
    }
    return self;
}


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
            }];
}


#pragma mark Transformers

+ (NSValueTransformer *)createdAtJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:ADNDateValueTransformerName];
}

@end
