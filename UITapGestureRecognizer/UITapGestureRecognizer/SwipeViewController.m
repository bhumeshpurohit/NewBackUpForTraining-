//
//  SwipeViewController.m
//  UITapGestureRecognizer
//
//  Created by Bhumesh on 11/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()
-(void)slideToRightWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer;

-(void)slideToLeftWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //orange
    UISwipeGestureRecognizer *swipeRightOrange=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(slideToRightWithGestureRecognizer:)];
    swipeRightOrange.direction=UISwipeGestureRecognizerDirectionRight;
    
    
    UISwipeGestureRecognizer *swipeLeftOrange=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(slideToLeftWithGestureRecognizer:)];
    swipeLeftOrange.direction=UISwipeGestureRecognizerDirectionLeft;
    
    [self.vieworange addGestureRecognizer:swipeRightOrange];
    [self.vieworange addGestureRecognizer:swipeLeftOrange];
    
    
//    //black

    
    UISwipeGestureRecognizer *swipeLeftBlack = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToLeftWithGestureRecognizer:)];
    swipeLeftBlack.direction = UISwipeGestureRecognizerDirectionLeft;
   
    [self.viewblack addGestureRecognizer:swipeLeftBlack];
    
    
    //green
    
    
    UISwipeGestureRecognizer *swipeRightGreen = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToRightWithGestureRecognizer:)];
    swipeRightGreen.direction = UISwipeGestureRecognizerDirectionRight;
    [self.viewgreen addGestureRecognizer:swipeRightGreen];
    
    // Do any additional setup after loading the view.
}
-(void)slideToRightWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    [UIView animateWithDuration:2.0 		animations:^{
        self.vieworange.frame = CGRectOffset(self.vieworange.frame, 320.0, 0.0);
        self.viewblack.frame = CGRectOffset(self.viewblack.frame, 320.0, 0.0);
        self.viewgreen.frame = CGRectOffset(self.viewgreen.frame, 320.0, 0.0);
    }];
}
-(void)slideToLeftWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    [UIView animateWithDuration:2.0 animations:^{
        self.vieworange.frame = CGRectOffset(self.vieworange.frame, -320.0, 0.0);
        self.viewblack.frame = CGRectOffset(self.viewblack.frame, -320.0, 0.0);
        self.viewgreen.frame = CGRectOffset(self.viewgreen.frame, -320.0, 0.0);
    }];
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
