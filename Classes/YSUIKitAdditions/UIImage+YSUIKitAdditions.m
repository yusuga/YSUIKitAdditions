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
    /* 
     http://stackoverflow.com/questions/990976/how-to-create-a-colored-1x1-uiimage-on-the-iphone-dynamically 
     */
    
    CGRect rect = CGRectMake(0., 0., 1., 1.);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
