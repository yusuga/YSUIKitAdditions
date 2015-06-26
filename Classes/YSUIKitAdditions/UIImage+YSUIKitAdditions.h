//
//  UIImage+YSUIKitAdditions.h
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/02/27.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YSUIKitAdditions)

+ (UIImage *)ys_imageFromColor:(UIColor *)color;
+ (UIImage *)ys_imageFromColor:(UIColor *)color withSize:(CGSize)size;

- (UIImage *)ys_overlayImage:(UIImage *)image;

@end
