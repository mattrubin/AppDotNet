//
//  ADNAccessControlList.m
//  AppDotNet
//
//  Created by Matt Rubin on 12/18/12.
//  Copyright (c) 2012 Matt Rubin. All rights reserved.
//

#import "ADNAccessControlList.h"


@implementation ADNAccessControlList

- (id)init
{
    self = [super init];
    if (self) {
        self.userIDs = [NSMutableArray new];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {

    if ([key isEqualToString:KEY_USER_IDS]) {

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
    return @{KEY_ANY_USER:@"anyUser", KEY_USER_IDS:@"userIDs"};
}

- (NSArray *)exportKeys
{
    return @[KEY_ANY_USER, KEY_IMMUTABLE, KEY_PUBLIC, KEY_YOU, KEY_USER_IDS];
}

@end
