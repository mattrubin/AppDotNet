//
//  ADNEntities.m
//  AppDotNet
//
//  Created by Me on 12/16/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNEntities.h"


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


- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:KEY_HASHTAGS]) {
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *hashtags = [NSMutableArray arrayWithCapacity:[value count]];
            for (id rawHashtag in value) {
                if ([rawHashtag isKindOfClass:[NSDictionary class]]) {
                    [hashtags addObject:[ADNHashtag instanceFromDictionary:rawHashtag]];
                }
            }
            self.hashtags = hashtags;
        }
    } else if ([key isEqualToString:KEY_LINKS]) {
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *links = [NSMutableArray arrayWithCapacity:[value count]];
            for (id rawLink in value) {
                if ([rawLink isKindOfClass:[NSDictionary class]]) {
                    [links addObject:[ADNLink instanceFromDictionary:rawLink]];
                }
            }
            self.links = links;
        }
    } else if ([key isEqualToString:KEY_MENTIONS]) {
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *mentions = [NSMutableArray arrayWithCapacity:[value count]];
            for (id rawMention in value) {
                if ([rawMention isKindOfClass:[NSDictionary class]]) {
                    [mentions addObject:[ADNMention instanceFromDictionary:rawMention]];
                }
            }
            self.mentions = mentions;
        }
    } else {
        [super setValue:value forKey:key];
    }
}

- (NSArray *)exportKeys
{
    return @[KEY_HASHTAGS, KEY_LINKS, KEY_MENTIONS];
}

- (id)valueForKey:(NSString *)key
{
    if ([key isEqualToString:KEY_HASHTAGS]) {
        NSMutableArray *value = [NSMutableArray arrayWithCapacity:self.hashtags.count];
        for (ADNHashtag *hashtag in self.hashtags) {
            [value addObject:hashtag.toDictionary];
        }
        return value;
    } else if ([key isEqualToString:KEY_LINKS]) {
        NSMutableArray *value = [NSMutableArray arrayWithCapacity:self.links.count];
        for (ADNLink *link in self.links) {
            [value addObject:link.toDictionary];
        }
        return value;
    } else if ([key isEqualToString:KEY_MENTIONS]) {
        NSMutableArray *value = [NSMutableArray arrayWithCapacity:self.mentions.count];
        for (ADNMention *mention in self.mentions) {
            [value addObject:mention.toDictionary];
        }
        return value;
    } else {
        return [super valueForKey:key];
    }
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"[%@:\n   mentions: %@\n   hashtags: %@\n   links: %@\n]", self.class, self.mentions, self.hashtags, self.links];
}

@end
