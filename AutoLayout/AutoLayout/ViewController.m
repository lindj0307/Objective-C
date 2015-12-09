//
//  ViewController.m
//  AutoLayout
//
//  Created by 林东杰 on 12/9/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 100, 100)];
    lable.text = @"lindj0307";
    [self.view addSubview:lable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
