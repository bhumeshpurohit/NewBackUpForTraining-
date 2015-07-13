//
//  ViewController.m
//  SteperDemo
//
//  Created by Bhumesh on 15/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end
@implementation ViewController
@synthesize newheight;
- (void)viewDidLoad {
    [super viewDidLoad];
    newheight=100.0;
  
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)valueChange:(id)sender {
    
   
    
    newheight=[(UIStepper *)sender value];
    self.testview.frame=CGRectMake(self.testview.frame.origin.x, self.testview.frame.origin.y, self.testview.frame.size.width, newheight);

}
@end
