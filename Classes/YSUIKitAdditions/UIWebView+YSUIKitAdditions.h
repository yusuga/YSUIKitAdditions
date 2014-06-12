//
//  UIWebView+YSUIKitAdditions.h
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/06/11.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YSUIWebViewOGPProperty) {
    YSUIWebViewOGPPropertyTitle,
    YSUIWebViewOGPPropertyType,
    YSUIWebViewOGPPropertyImage,
    YSUIWebViewOGPPropertyURL,
};

@interface UIWebView (YSUIKitAdditions)

- (NSString*)ys_html;
- (NSString *)ys_htmlHead;
- (NSString*)ys_htmlBody;

- (NSString*)ys_title;

- (NSString*)ys_ogpForProperty:(YSUIWebViewOGPProperty)property;
- (NSString*)ys_appleTouchIconURLStringOfLinkTag;

- (void)ys_disableLongPressActionSheet;

@end
