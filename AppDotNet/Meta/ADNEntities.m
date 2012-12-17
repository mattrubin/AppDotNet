//
//  ADNEntities.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNEntities.h"

#import "NSDictionary+ADN.h"


#define ENTITY_KEY_MENTIONS @"mentions"
#define ENTITY_KEY_HASHTAGS @"hashtags"
#define ENTITY_KEY_LINKS    @"links"


@implementation ADNEntities

- (id)init
{
    self = [super init];
    if (self) {
        self.mentions = [NSMutableArray array];
        self.hashtags = [NSMutableArray array];
        self.links = [NSMutableArray array];
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [self init];
    if (self) {
        [self updateWithDictionary:dictionary];
    }
    return self;
}

+ (id)entitiesFromDictionary:(NSDictionary *)dictionary
{
    return [[ADNEntities alloc] initWithDictionary:dictionary];
}

- (void)updateWithDictionary:(NSDictionary *)dictionary
{
    NSArray *rawMentions = [dictionary arrayForKey:ENTITY_KEY_MENTIONS];
    for (NSDictionary *mentionDictionary in rawMentions) {
        ADNMention *newMention = [ADNMention mentionFromDictionary:mentionDictionary];
        // TODO: check for errors and discard if malformed?
        [(NSMutableArray*)self.mentions addObject:newMention];
    }
    
    NSArray *rawHashtags = [dictionary arrayForKey:ENTITY_KEY_HASHTAGS];
    for (NSDictionary *hashtagDictionary in rawHashtags) {
        ADNHashtag *newHashtag = [ADNHashtag hashtagFromDictionary:hashtagDictionary];
        // TODO: check for errors and discard if malformed?
        [(NSMutableArray*)self.hashtags addObject:newHashtag];
    }
    
    NSArray *rawLinks = [dictionary arrayForKey:ENTITY_KEY_LINKS];
    for (NSDictionary *linkDictionary in rawLinks) {
        ADNLink *newLink = [ADNLink linkFromDictionary:linkDictionary];
        // TODO: check for errors and discard if malformed?
        [(NSMutableArray*)self.links addObject:newLink];
    }
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@:\n   mentions: %@\n   hashtags: %@\n   links: %@\n]", self.class, self.mentions, self.hashtags, self.links];
}

@end
