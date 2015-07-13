//
//  ViewController.m
//  MyFirstDemoProject
//
//  Created by Bhumesh on 16/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize usrname;
@synthesize switchControl;
@synthesize objUserViewController;

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.usrname resignFirstResponder];
    return true;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view, typically from a nib.
  //  UIView * yourView = [[UIView alloc] initWithFrame:CGRectMake(10.f, 100.f, 300.f, 100.f)];
    UIImage * targetImage = [UIImage imageNamed:@"login.jpg"];
    
    // redraw the image to fit |yourView|'s size
    UIGraphicsBeginImageContextWithOptions(self.testView.frame.size, NO, 0.f);
    [targetImage drawInRect:CGRectMake(0.f, 0.f, self.testView.frame.size.width, self.testView.frame.size.height)];
    UIImage * resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.testView setBackgroundColor:[UIColor colorWithPatternImage:resultImage]];
    self.loginview.layer.cornerRadius = 20;
//    
//    ((UILabel *)[[[[[[switchControl subviews] lastObject] subviews] objectAtIndex:2] subviews] objectAtIndex:0]).text = @"Yes";
//    ((UILabel *)[[[[[[switchControl subviews] lastObject] subviews] objectAtIndex:2] subviews] objectAtIndex:1]).text = @"No";
    
    
//    [self.usrname addRegx:@"^.{3,10}$" withMsg:@"User name characters limit should be come between 3-10"];
    
    
   // UIColor *background=[[UIColor alloc ]initWithPatternImage:[UIImage imageNamed:@"login.jpg"]];
  //  self.testView.backgroundColor=background;
    self.usrname.isMandatory=YES;
    
    [self.usrname addRegx:@"[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" withMsg:@"Enter valid email."];
    [self.txtPassword addRegx:@"^.{6,50}$" withMsg:@"Password characters limit should be come between 6-20"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SignIn:(id)sender {
    if([self.usrname validate] & [self.txtPassword validate] )
    {
       // objUserViewController2=[[UserViewController alloc]init];
       // objUserViewController2.Name=self.usrname.text;

        UIStoryboard *    storyboardobj=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
       objUserViewController = [storyboardobj instantiateViewControllerWithIdentifier:@"UserViewController"];
        objUserViewController.Name = self.usrname.text;
        [self.navigationController pushViewController:objUserViewController animated:YES];
        
        
    }
    
}
-(BOOL) checkIfUsernameValidation
    {
//    NSString *username = usrname.text;
//    NSString *expression = @".!#$%&'*+-/=?^_`{|}~@,;";
//    
//    if(![username compare:expression])
//    {
//        return YES;
//    }
//    else
//        return NO;
        
        return true;
}
- (IBAction)SignUp:(id)sender
{
    
}
- (IBAction)FacebookLogin:(id)sender
{
    
}
@end
