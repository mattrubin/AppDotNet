//
//  ADNAccessControlList.m
//  AppDotNet
//
//  Created by Matt Rubin on 12/18/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNAccessControlList.h"


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


- (NSDictionary *)alteredKeys
{
    return @{ACL_KEY_ANY_USER:@"anyUser", ACL_KEY_USER_IDS:@"userIDs"};
}

- (NSArray *)exportKeys
{
    return @[ACL_KEY_ANY_USER, ACL_KEY_IMMUTABLE, ACL_KEY_PUBLIC, ACL_KEY_YOU, ACL_KEY_USER_IDS];
}

@end
