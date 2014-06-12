//
//  UIWebView+YSUIKitAdditions.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/06/11.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "UIWebView+YSUIKitAdditions.h"

@implementation UIWebView (YSUIKitAdditions)

#pragma mark - html

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
    
    NSString *urlStr = [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"\
var metas = document.getElementsByTagName('meta');\
for (i = 0; i < metas.length; i++) {\
    if (metas[i].getAttribute(\"property\") == \"%@\") {\
        metas[i].getAttribute(\"content\");\
    }\
}", propertyStr]];
    return urlStr.length ? urlStr : nil;
}

/**
 apple-touch-icon
 https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html
 https://developer.apple.com/jp/devcenter/ios/library/documentation/userexperience/conceptual/mobilehig/WebClipIcons/WebClipIcons.html
 
 ex)
 http://www.apple.com/apple-touch-icon.png
 */

- (NSString*)ys_appleTouchIconURLString
{
    NSString *urlStr = [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"\
var links = document.getElementsByTagName('link');\
for (i = 0; i < links.length; i++) {\
    if (links[i].getAttribute(\"rel\").search(\"^apple-touch-icon[\\w]*\") != -1) {\
        links[i].getAttribute(\"href\");\
    }\
}"]];
    return urlStr.length ? urlStr : nil;
}

#pragma mark -

- (void)ys_disableLongPressActionSheet
{
    [self stringByEvaluatingJavaScriptFromString:@"document.body.style.webkitTouchCallout = 'none'"];
}

@end
