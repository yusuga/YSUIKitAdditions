//
//  UIButton+YSUIKitAdditions.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2016/04/05.
//  Copyright © 2016年 Yu Sugawara. All rights reserved.
//

#import "UIButton+YSUIKitAdditions.h"
#import "UIImage+YSUIKitAdditions.h"

@implementation UIButton (YSUIKitAdditions)

- (void)ys_setBackgroundColor:(UIColor *)color
                     forState:(UIControlState)state
{
    /*
     *  http://stackoverflow.com/a/30604658
     */    
    [self setBackgroundImage:[UIImage ys_imageFromColor:color] forState:state];
}

@end
