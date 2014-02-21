//
//  NSDictionary+YSUIKitAdditions.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/02/21.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "NSDictionary+YSUIKitAdditions.h"

@implementation NSDictionary (YSUIKitAdditions)

- (id)objectOrNilForKey:(id)aKey
{
    id obj = [self objectForKey:aKey];
    if (obj == [NSNull null]) {
        return nil;
    } else {
        return obj;
    }
}

@end
