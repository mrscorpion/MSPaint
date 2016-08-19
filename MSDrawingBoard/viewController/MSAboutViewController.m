//
//  MSAboutViewController.m
//  MSDrawingBoard
//
//  Created by mr.scorpion on 16/6/24.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "MSAboutViewController.h"
#import "MSNavigationItem.h"
@interface MSAboutViewController ()

@end

@implementation MSAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    MSNavigationItem *navigation = [[MSNavigationItem alloc]initWithFrame:self.view.frame buttonName:@"ic_back_dark" title:@"关于" AndPushButtonblock:^{
        [self dismissViewControllerAnimated:YES completion:nil];
        //[self popoverPresentationController];
    }];
    
    [self.view addSubview:navigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
