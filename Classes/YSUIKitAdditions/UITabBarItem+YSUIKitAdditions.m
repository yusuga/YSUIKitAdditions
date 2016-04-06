//
//  UITabBarItem+YSUIKitAdditions.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2016/04/06.
//  Copyright © 2016年 Yu Sugawara. All rights reserved.
//

#import "UITabBarItem+YSUIKitAdditions.h"
#import <YSNSFoundationAdditions/NSString+YSNSFoundationAdditions.h>

static CGFloat kTabBarItemMaxWidth = 50.;

@implementation UITabBarItem (YSUIKitAdditions)

+ (instancetype)ys_fittedTitleItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
{
    return [self ys_fittedTitleItemWithTitle:title
                                       image:image
                                boundingSize:CGSizeMake(kTabBarItemMaxWidth,
                                                        CGFLOAT_MAX)];
}

+ (instancetype)ys_fittedTitleItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                               boundingSize:(CGSize)boundingSize
{
    return [self ys_fittedTitleItemWithTitle:title
                                       image:image
                                boundingSize:boundingSize
                                        font:[self ys_defaultTabBarItemFont]];
}

+ (instancetype)ys_fittedTitleItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                               boundingSize:(CGSize)boundingSize
                                       font:(UIFont *)font
{
    NSString *tabBarTitle = [title ys_writingSubstringWithBoundingSize:boundingSize font:font];
    return [[UITabBarItem alloc] initWithTitle:tabBarTitle.length == title.length ? tabBarTitle : [tabBarTitle stringByAppendingString:@"…"]
                                         image:image
                                 selectedImage:nil];
}

+ (UIFont *)ys_defaultTabBarItemFont
{
    return [UIFont systemFontOfSize:10.];
}

@end
