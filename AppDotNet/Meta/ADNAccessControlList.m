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

    if ([key isEqualToString:@"user_ids"]) {

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

    if ([key isEqualToString:@"any_user"]) {
        [self setValue:value forKey:@"anyUser"];
    } else if ([key isEqualToString:@"user_ids"]) {
        [self setValue:value forKey:@"userIDs"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


@end
