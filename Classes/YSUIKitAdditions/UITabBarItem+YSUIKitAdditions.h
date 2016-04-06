//
//  UITabBarItem+YSUIKitAdditions.h
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2016/04/06.
//  Copyright © 2016年 Yu Sugawara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (YSUIKitAdditions)

+ (instancetype)ys_fittedTitleItemWithTitle:(NSString *)title
                                      image:(UIImage *)image;
+ (instancetype)ys_fittedTitleItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                               boundingSize:(CGSize)boundingSize;
+ (instancetype)ys_fittedTitleItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                               boundingSize:(CGSize)boundingSize
                                       font:(UIFont *)font;

@end
