//
//  UIView+YSUIKitAdditions.h
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/01/26.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YSUIKitAdditions)

- (id)ys_findFirstResponder;

- (void)ys_setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets;
- (UIEdgeInsets)ys_hitTestEdgeInsets;
- (CGRect)ys_hitFrame;

- (UIImage *)ys_image;

+ (void)ys_defaultKeyboardAnimateWithAnimations:(void (^)(void))animations
                                     completion:(void (^)(BOOL finished))completion;

@end
