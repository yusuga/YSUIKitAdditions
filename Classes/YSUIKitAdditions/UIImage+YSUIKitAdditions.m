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
    return [self ys_imageFromColor:color withSize:CGSizeMake(1., 1.)];
}

+ (UIImage *)ys_imageFromColor:(UIColor *)color withSize:(CGSize)size
{
    /**
     *  http://stackoverflow.com/questions/990976/how-to-create-a-colored-1x1-uiimage-on-the-iphone-dynamically
     */
    CGRect rect = CGRectMake(0.,
                             0.,
                             size.width > 0. ? size.width : 1.,
                             size.height > 0. ? size.height : 1.);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (context == NULL) return nil;
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

#pragma mark -

- (UIImage *)ys_overlayImage:(UIImage *)image
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.);
    [self drawInRect:CGRectMake(0. ,0. , self.size.width, self.size.height)];
    [image drawInRect:CGRectMake(0. ,0. , image.size.width, image. size.height)];
    UIImage *overlayedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return overlayedImage;
}

@end
