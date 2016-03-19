//
//  UISearchBar+YSUIKitAdditions.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2016/02/26.
//  Copyright © 2016年 Yu Sugawara. All rights reserved.
//

#import "UISearchBar+YSUIKitAdditions.h"

@implementation UISearchBar (YSUIKitAdditions)

- (UITextField *)ys_textFiled
{
    UITextField *textFiled;
    for (UIView *subView in self.subviews) {
        for (UITextField *tf in subView.subviews) {
            if ([tf isKindOfClass:[UITextField class]]) {
                textFiled = tf;
                break;
            }
        }
        if (textFiled) {
            break;
        }
    }
    NSParameterAssert(textFiled);
    return textFiled;
}

@end
