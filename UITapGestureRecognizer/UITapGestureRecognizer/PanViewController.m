//
//  PanViewController.m
//  UITapGestureRecognizer
//
//  Created by Bhumesh on 11/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()
-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer;
@end

@implementation PanViewController
@synthesize Xposition,Yposition;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIPanGestureRecognizer *panGestureRecognizer=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
    [self.testView addGestureRecognizer:panGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
    
    self.testView.center = touchLocation;
    
   NSString *xval= [NSString stringWithFormat:@"%f",touchLocation.x];
    NSLog(@"%@",xval);
    NSString *yval=[NSString stringWithFormat:@"%f",touchLocation.y];
    NSLog(@"%@",yval);
    
    Yposition.text=yval;
   
   
    
    Xposition.text=xval;
    
    
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
