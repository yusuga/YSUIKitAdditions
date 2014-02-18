//
//  UIView+YSUIKitAdditions.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/01/26.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "UIView+YSUIKitAdditions.h"

@implementation UIView (YSUIKitAdditions)

/* http://stackoverflow.com/questions/1823317/get-the-current-first-responder-without-using-a-private-api/1823360#1823360 */

- (id)ys_findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        id responder = [subView ys_findFirstResponder];
        if (responder) return responder;
    }
    return nil;
}

@end