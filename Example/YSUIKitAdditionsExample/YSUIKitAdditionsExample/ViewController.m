//
//  ViewController.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/01/26.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "ViewController.h"
#import "UIView+YSUIKitAdditions.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.button ys_setHitTestEdgeInsets:UIEdgeInsetsMake(-50.f, -50.f, -50.f, -50.f)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonDidPush:(id)sender
{
    NSLog(@"%s", __func__);
}

@end
