//
//  ViewController.m
//  UIProgressViewExample
//
//  Created by Bhumesh on 15/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController
@synthesize progressView,progressValue;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startProgress:(id)sender {
    progressValue = 0.0f;
    
    [self increaseProgressValue];
}
-(void)increaseProgressValue

{
    if(progressView.progress<1)
        
    {
        
        progressValue = progressValue+0.01;
        
        progressView.progress = progressValue;
        
        [self performSelector:@selector(increaseProgressValue) withObject:self afterDelay:0.1];
        
    }
}
- (IBAction)startReset:(id)sender {
    progressValue=0;
    progressView.progress=0;
    
}
@end
