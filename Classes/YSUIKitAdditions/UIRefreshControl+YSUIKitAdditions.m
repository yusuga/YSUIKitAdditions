//
//  UIRefreshControl+YSUIKitAdditions.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2016/03/04.
//  Copyright © 2016年 Yu Sugawara. All rights reserved.
//

#import "UIRefreshControl+YSUIKitAdditions.h"

@implementation UIRefreshControl (YSUIKitAdditions)

- (void)ys_fixAttributedTitlePosition
{
    /*
     *  Fix refreshControl.attributedTitle position.
     *  http://stackoverflow.com/questions/19121276/uirefreshcontrol-incorrect-title-offset-during-first-run-and-sometimes-title-mis
     */
    dispatch_async(dispatch_get_main_queue(), ^{
        [self beginRefreshing];
        [self endRefreshing];
    });
}

@end
