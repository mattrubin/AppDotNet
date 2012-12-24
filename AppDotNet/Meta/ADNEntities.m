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


@interface ADNEntities ()

@property (nonatomic, strong, readwrite) NSMutableArray *mentions;
@property (nonatomic, strong, readwrite) NSMutableArray *hashtags;
@property (nonatomic, strong, readwrite) NSMutableArray *links;

@end


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

- (void)setAttributesFromDictionary:(NSDictionary *)dictionary
{
    NSArray *rawMentions = [dictionary arrayForKey:ENTITY_KEY_MENTIONS];
    for (NSDictionary *mentionDictionary in rawMentions) {
        ADNMention *newMention = [ADNMention instanceFromDictionary:mentionDictionary];
        // TODO: check for errors and discard if malformed?
        [self.mentions addObject:newMention];
    }
    
    NSArray *rawHashtags = [dictionary arrayForKey:ENTITY_KEY_HASHTAGS];
    for (NSDictionary *hashtagDictionary in rawHashtags) {
        ADNHashtag *newHashtag = [ADNHashtag instanceFromDictionary:hashtagDictionary];
        // TODO: check for errors and discard if malformed?
        [self.hashtags addObject:newHashtag];
    }
    
    NSArray *rawLinks = [dictionary arrayForKey:ENTITY_KEY_LINKS];
    for (NSDictionary *linkDictionary in rawLinks) {
        ADNLink *newLink = [ADNLink instanceFromDictionary:linkDictionary];
        // TODO: check for errors and discard if malformed?
        [self.links addObject:newLink];
    }
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@:\n   mentions: %@\n   hashtags: %@\n   links: %@\n]", self.class, self.mentions, self.hashtags, self.links];
}

@end
