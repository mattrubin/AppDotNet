//
//  ADNPost.m
//  AppDotNet
//
//  Created by Me on 12/14/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNPost.h"
#import "ADNHelper.h"


@implementation ADNPost

- (id)init
{
    self = [super init];
    if (self) {
        self.annotations = [ADNAnnotationCollection new];
    }
    return self;
}


+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"postId": KEY_ID,
            @"createdAt":KEY_CREATED_AT,
            @"replyToId": KEY_REPLY_TO,
            @"canonicalURL": KEY_CANONICAL_URL,
            @"threadId": KEY_THREAD_ID,
            @"numReplies": KEY_NUM_REPLIES,
            @"numStars": @"num_stars",
            @"numReposts": @"num_reposts",
            @"isDeleted": KEY_IS_DELETED,
            @"machineOnly": KEY_MACHINE_ONLY,
            @"youStarred": @"you_starred",
            @"starredBy": @"starred_by",
            @"youReposted": @"you_reposted",
            @"repostOf": @"repost_of",
            }];
}


#pragma mark Transformers

+ (NSValueTransformer *)createdAtTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *dateString) {
        return [[ADNHelper dateFormatter] dateFromString:dateString];
    } reverseBlock:^id(NSDate *date) {
        return [[ADNHelper dateFormatter] stringFromDate:date];
    }];
}

@end
