//
//  ADNMessage.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNMessage.h"


@implementation ADNMessage

- (id)init
{
    self = [super init];
    if (self) {
        self.annotations = [ADNAnnotationCollection new];
        self.entities = [ADNEntities new];
    }
    return self;
}


#pragma mark Keys

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"channelId": ADNFieldChannelId,
            @"createdAt": ADNFieldCreatedAt,
            @"messageId": ADNFieldId,
            @"machineOnly": ADNFieldMachineOnly,
            @"numReplies": ADNFieldNumReplies,
            @"threadId": ADNFieldThreadId,
            @"replyToId": ADNFieldReplyTo,
            @"isDeleted": ADNFieldIsDeleted,
            }];
}


#pragma mark Transformers

+ (NSValueTransformer *)createdAtTransformer
{
    return [NSValueTransformer valueTransformerForName:ADNDateValueTransformerName];
}

@end
