//
//  ViewController.m
//  TaskByAadil
//
//  Created by Bhumesh on 18/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *newDate1 = [_dtpicker.date dateByAddingTimeInterval:60*60*24*1];
    _dtpicker.minimumDate=newDate1;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
