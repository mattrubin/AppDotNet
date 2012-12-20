//
//  ADNAccessControlList.m
//  AppDotNet
//
//  Created by Matt Rubin on 12/18/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNAccessControlList.h"

#define ACL_KEY_ANY_USER    @"any_user"
#define ACL_KEY_IMMUTABLE   @"immutable"
#define ACL_KEY_PUBLIC      @"public"
#define ACL_KEY_YOU         @"you"
#define ACL_KEY_USER_IDS    @"user_ids"


@implementation ADNAccessControlList

- (void)setValue:(id)value forKey:(NSString *)key {

    if ([key isEqualToString:ACL_KEY_USER_IDS]) {

        if ([value isKindOfClass:[NSArray class]]) {

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                [myMembers addObject:valueMember];
            }

            self.userIDs = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

    if ([key isEqualToString:ACL_KEY_ANY_USER]) {
        [self setValue:value forKey:@"anyUser"];
    } else if ([key isEqualToString:ACL_KEY_USER_IDS]) {
        [self setValue:value forKey:@"userIDs"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary*)toDictionary
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    [dictionary setObject:[NSNumber numberWithBool:self.anyUser]   forKey:ACL_KEY_ANY_USER];
    [dictionary setObject:[NSNumber numberWithBool:self.immutable] forKey:ACL_KEY_IMMUTABLE];
    [dictionary setObject:[NSNumber numberWithBool:self.public]    forKey:ACL_KEY_PUBLIC];
    [dictionary setObject:[NSNumber numberWithBool:self.you]       forKey:ACL_KEY_YOU];
    
    if (self.userIDs)
        [dictionary setObject:self.userIDs.copy forKey:ACL_KEY_USER_IDS];
    
    return dictionary;
}

@end
