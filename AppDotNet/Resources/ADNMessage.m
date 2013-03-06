//
//  ADNMessage.m
//  AppDotNet
//
//  Created by Matt Rubin on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNMessage.h"


@implementation ADNMessage

- (id)init
{
    self = [super init];
    if (self) {
        self.entities = [ADNEntities new];
    }
    return self;
}


#pragma mark Keys

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [super.JSONKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
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

+ (NSValueTransformer *)createdAtJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:ADNDateValueTransformerName];
}

+ (NSValueTransformer *)annotationsJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:ADNAnnotationArrayValueTransformerName];
}

@end
