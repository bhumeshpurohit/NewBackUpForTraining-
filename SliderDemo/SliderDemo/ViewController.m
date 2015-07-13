//
//  ViewController.m
//  SliderDemo
//
//  Created by Bhumesh on 12/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SliderValueChange:(id)sender {
     self.lblValue.text = [NSString stringWithFormat:@"%f", self.slider.value*100];
}
@end
