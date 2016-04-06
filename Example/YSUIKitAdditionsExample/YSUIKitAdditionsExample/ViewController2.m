//
//  ViewController2.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 6/26/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "ViewController2.h"
#import "UIView+YSUIKitAdditions.h"
#import "UIImage+YSUIKitAdditions.h"
#import "UITabBarItem+YSUIKitAdditions.h"

@interface ViewController2 ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController2

- (void)awakeFromNib
{
    self.tabBarItem = [UITabBarItem ys_fittedTitleItemWithTitle:@"long long long long long" image:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = self.imageView.bounds;
    label.text = @"UIImage from UILabel";
    label.textColor = [UIColor redColor];
    label.numberOfLines = 2;
    label.backgroundColor = [UIColor whiteColor];
    
    UILabel *overlayLabel = [[UILabel alloc] init];
    overlayLabel.frame = self.imageView.bounds;
    overlayLabel.text = @"Overlay";
    overlayLabel.textColor = [UIColor lightGrayColor];
    overlayLabel.font = [UIFont boldSystemFontOfSize:30.];
    
    UIImage *labelImage = [label ys_image];
    UIImage *overlayImage = [overlayLabel ys_image];
    
    self.imageView.image = [labelImage ys_overlayImage:overlayImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
