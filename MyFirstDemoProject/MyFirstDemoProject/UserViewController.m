//
//  UserViewController.m
//  MyFirstDemoProject
//
//  Created by Bhumesh on 16/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController
@synthesize lblname;
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage * targetImage = [UIImage imageNamed:@"login.jpg"];
    
    // redraw the image to fit |yourView|'s size
    UIGraphicsBeginImageContextWithOptions(self.testView.frame.size, NO, 0.f);
    [targetImage drawInRect:CGRectMake(0.f, 0.f, self.testView.frame.size.width, self.testView.frame.size.height)];
    UIImage * resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.testView setBackgroundColor:[UIColor colorWithPatternImage:resultImage]];
    
    self.lblname.text=[self.lblname.text stringByAppendingString:self.Name];
    // Do any additional setup after loading the view from its nib.
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
