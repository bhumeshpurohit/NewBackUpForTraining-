//
//  ViewController.m
//  ScrollViewDemo
//
//  Created by Bhumesh on 23/06/15.
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"Did Start Scroll");
}// any offset changes
- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2)
{
    NSLog(@"Zomming:");
}// any zoom scale changes

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"Draging:");
}
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"Decelerating");
}// called on finger up as we are moving




- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"Zoooooommmmmm");
    return self.imgview;
}     // return a view that will be scaled. if delegate returns nil, nothing happens





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
