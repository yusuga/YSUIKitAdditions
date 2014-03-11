//
//  UIImage+YSUIKitAdditions.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/02/27.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "UIImage+YSUIKitAdditions.h"

@implementation UIImage (YSUIKitAdditions)

+ (UIImage *)ys_imageFromColor:(UIColor *)color
{
    return [self ys_imageFromColor:color withSize:CGSizeMake(1.f, 1.f)];
}

+ (UIImage *)ys_imageFromColor:(UIColor *)color withSize:(CGSize)size
{
    /*
     http://stackoverflow.com/questions/990976/how-to-create-a-colored-1x1-uiimage-on-the-iphone-dynamically
     */
    
    CGRect rect = CGRectMake(0.f, 0.f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (context == NULL) return nil;
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
