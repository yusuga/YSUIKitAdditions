//
//  UIWebView+YSUIKitAdditions.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/06/11.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "UIWebView+YSUIKitAdditions.h"

@implementation UIWebView (YSUIKitAdditions)

#pragma mark - get html

- (NSString*)ys_html
{
    return [self stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('html')[0].outerHTML"];
}

- (NSString *)ys_htmlHead
{
    return [self stringByEvaluatingJavaScriptFromString:@"document.head.innerHTML"];
}

- (NSString*)ys_htmlBody
{
    return [self stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"];
}

- (NSString*)ys_title
{
    return [self stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('title')[0].textContent;"];
}

#pragma mark - OGP

/* http://ogp.me */

- (NSString*)ys_ogpForProperty:(YSUIWebViewOGPProperty)property
{
    NSString *propertyStr;
    switch (property) {
        case YSUIWebViewOGPPropertyTitle:
            propertyStr = @"og:title";
            break;
        case YSUIWebViewOGPPropertyType:
            propertyStr = @"og:type";
            break;
        case YSUIWebViewOGPPropertyImage:
            propertyStr = @"og:image";
            break;
        case YSUIWebViewOGPPropertyURL:
            propertyStr = @"og:url";
            break;
        default:
            NSLog(@"%s, undefined property: %zd", __func__, property);
            return nil;
    }
    
    return [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"\
var metas = document.getElementsByTagName('meta');\
for (i = 0; i < metas.length; i++) {\
    if (metas[i].getAttribute(\"property\") == \"%@\") {\
        metas[i].getAttribute(\"content\");\
    }\
}", propertyStr]];
}

#pragma mark -

- (void)ys_disableLongPressActionSheet
{
    [self stringByEvaluatingJavaScriptFromString:@"document.body.style.webkitTouchCallout = 'none'"];
}

@end
