//
//  UIView+YSUIKitAdditions.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/01/26.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "UIView+YSUIKitAdditions.h"
#import <objc/runtime.h>

@implementation UIView (YSUIKitAdditions)

#pragma mark -

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

#pragma mark - Hit test

/* http://stackoverflow.com/questions/808503/uibutton-making-the-hit-area-larger-than-the-default-hit-area */

static const NSString *KEY_HIT_TEST_EDGE_INSETS = @"HitTestEdgeInsets";

- (void)ys_setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets
{
    NSValue *value = [NSValue value:&hitTestEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)ys_hitTestEdgeInsets
{
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS);
    if(value) {
        UIEdgeInsets edgeInsets; [value getValue:&edgeInsets];
        return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (CGRect)ys_hitFrame
{
    if(UIEdgeInsetsEqualToEdgeInsets(self.ys_hitTestEdgeInsets, UIEdgeInsetsZero)) {
        return self.bounds;
    } else {
        return UIEdgeInsetsInsetRect(self.bounds, self.ys_hitTestEdgeInsets);
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return CGRectContainsPoint([self ys_hitFrame], point);
}

@end