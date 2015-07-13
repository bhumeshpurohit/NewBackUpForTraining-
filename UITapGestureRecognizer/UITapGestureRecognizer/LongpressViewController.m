//
//  LongpressViewController.m
//  UITapGestureRecognizer
//
//  Created by Bhumesh on 15/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "LongpressViewController.h"

@interface LongpressViewController ()

@end

@implementation LongpressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILongPressGestureRecognizer *longpressGesture=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongpressGesture:)];
    
  
    [self.testView addGestureRecognizer:longpressGesture];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleLongpressGesture:(UILongPressGestureRecognizer *)longpressGesture
{
    CGFloat newheight=100.0;
    if(self.testView.frame.size.height==100)
    {
        newheight=300.0;
    }
    CGPoint currentcenter=self.testView.center;
    self.testView.frame=CGRectMake(self.testView.frame.origin.x, self.testView.frame.origin.y, self.testView.frame.size.width, newheight);
    self.testView.center=currentcenter;
    
    
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
