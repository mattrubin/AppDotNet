//
//  ADNChannel.m
//  AppDotNet
//
//  Created by Me on 12/15/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNChannel.h"

@implementation ADNChannel

+ (ADNChannel *)instanceFromDictionary:(NSDictionary *)aDictionary {
    
    ADNChannel *instance = [[ADNChannel alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
    
}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {
    
    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }
    
    [self setValuesForKeysWithDictionary:aDictionary];
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    
    if ([key isEqualToString:@"annotations"]) {
        
        if ([value isKindOfClass:[NSArray class]]) {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                ADNAnnotation *populatedMember = [ADNAnnotation annotationFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.annotations = myMembers;
            
        }
        
    } else if ([key isEqualToString:@"owner"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.owner = [ADNUser userFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"readers"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.readers = [ADNAccessControlList instanceFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"writers"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.writers = [ADNAccessControlList instanceFromDictionary:value];
        }
        
    } else {
        [super setValue:value forKey:key];
    }
    
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"has_unread"]) {
        [self setValue:value forKey:@"hasUnread"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"channelID"];
    } else if ([key isEqualToString:@"you_can_edit"]) {
        [self setValue:value forKey:@"youCanEdit"];
    } else if ([key isEqualToString:@"you_subscribed"]) {
        [self setValue:value forKey:@"youSubscribed"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
    
}

@end
