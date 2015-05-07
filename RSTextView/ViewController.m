//
//  ViewController.m
//  RSTextView
//
//  Created by RedScor Yuan on 2015/5/7.
//  Copyright (c) 2015年 RedScor Yuan. All rights reserved.
//

#import "ViewController.h"
#import "RSTextView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet RSTextView *nibTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    RSTextView *textView = [[RSTextView alloc]initWithFrame:CGRectMake(0, 100, width, 200)];
    textView.placeholder = @"input text here ...";
    [self.view addSubview:textView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
