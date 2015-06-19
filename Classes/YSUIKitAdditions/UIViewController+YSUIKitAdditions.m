//
//  UIViewController+YSUIKitAdditions.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 6/19/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "UIViewController+YSUIKitAdditions.h"

@implementation UIViewController (YSUIKitAdditions)

- (BOOL)ys_isVisible
{
    /**
     *  How to tell if UIViewController's view is visible
     *  http://stackoverflow.com/questions/2777438/how-to-tell-if-uiviewcontrollers-view-is-visible
     */
    return self.isViewLoaded && self.view.window;
}

@end
