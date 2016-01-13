//
//  ViewController.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/01/26.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "ViewController.h"
#import "UIView+YSUIKitAdditions.h"
#import "UIWebView+YSUIKitAdditions.h"
#import "UIViewController+YSUIKitAdditions.h"

@interface ViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.button ys_setHitTestEdgeInsets:UIEdgeInsetsMake(-50.f, -50.f, -50.f, -50.f)];
    
    NSString *urlStr;
    urlStr = @"http://www.apple.com";
    urlStr = @"http://google.com";
//    urlStr = @"http://arigato-ipod.com";
//    urlStr = @"http://arigato-ipod.com/introduction.html";
    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlStr]]];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.
                                                  target:self
                                                selector:@selector(visibleLog)
                                                userInfo:nil
                                                 repeats:YES];
}

- (IBAction)buttonDidPush:(id)sender
{
    NSLog(@"%s", __func__);
}

- (IBAction)unwindToTopViewController:(UIStoryboardSegue *)segue
{
}

- (void)visibleLog
{
    NSLog(@"isVisible = %zd", [self ys_isVisible]);
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"%s", __func__);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"%s", __func__);
//    NSLog(@"%@", [webView ys_html]);
//    NSLog(@"%@", [webView ys_htmlHead]);
//    NSLog(@"%@", [webView ys_htmlBody]);
    NSLog(@"title: %@", [webView ys_title]);
    NSLog(@"OGP title: %@", [webView ys_ogpForProperty:YSUIWebViewOGPPropertyTitle]);
    NSLog(@"OGP type: %@", [webView ys_ogpForProperty:YSUIWebViewOGPPropertyType]);
    NSLog(@"OGP image: %@", [webView ys_ogpForProperty:YSUIWebViewOGPPropertyImage]);
    NSLog(@"OGP url: %@", [webView ys_ogpForProperty:YSUIWebViewOGPPropertyURL]);
    NSLog(@"apple-touch-icon: %@", [webView ys_appleTouchIconURLStringOfLinkTag]);
}

@end
