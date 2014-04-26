//
//  UIColor+YSUIKitAdditions.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/04/26.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "UIColor+YSUIKitAdditions.h"

@implementation UIColor (YSUIKitAdditions)

- (void)ys_getRed:(CGFloat*)r green:(CGFloat*)g blue:(CGFloat*)b alpha:(CGFloat*)a
{
    if (![self getRed:r green:g blue:b alpha:a]) {
        [self getWhite:r alpha:a];
        *g = *b = *r;
    }
}

@end
