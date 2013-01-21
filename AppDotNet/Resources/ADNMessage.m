//
//  ADNMessage.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNMessage.h"
#import "ADNHelper.h"


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
            @"channelId": KEY_CHANNEL_ID,
            @"createdAt": KEY_CREATED_AT,
            @"messageId": KEY_ID,
            @"machineOnly": KEY_MACHINE_ONLY,
            @"numReplies": KEY_NUM_REPLIES,
            @"threadId": KEY_THREAD_ID,
            @"replyToId": KEY_REPLY_TO,
            @"isDeleted": KEY_IS_DELETED,
            }];
}

- (NSSet *)conversionKeys
{
    return [NSSet setWithArray:@[KEY_ANNOTATIONS, KEY_ENTITIES, KEY_SOURCE, KEY_USER, @"createdAt"]];
}

#pragma mark Transformers

+ (NSValueTransformer *)annotationsTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSArray *annotations) {
        return [ADNAnnotationCollection instanceFromArray:annotations];
    } reverseBlock:^id(ADNAnnotationCollection *annotations) {
        return annotations.toArray;
    }];
}

+ (NSValueTransformer *)entitiesTransformer
{
    return [ADNEntities transformerForClass];
}

+ (NSValueTransformer *)sourceTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSDictionary *dictionary) {
        return [ADNSource instanceFromDictionary:dictionary];
    } reverseBlock:^id(ADNSource *source) {
        return source.toDictionary;
    }];
}

+ (NSValueTransformer *)userTransformer
{
    return [ADNUser transformerForClass];
}

+ (NSValueTransformer *)createdAtTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *dateString) {
        return [[ADNHelper dateFormatter] dateFromString:dateString];
    } reverseBlock:^id(NSDate *date) {
        return [[ADNHelper dateFormatter] stringFromDate:date];
    }];
}

@end
