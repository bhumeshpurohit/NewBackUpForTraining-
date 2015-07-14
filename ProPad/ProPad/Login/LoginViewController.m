//
//  ViewController.m
//  ProPad
//
//  Created by Bhumesh on 29/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "LoginViewController.h"
#import "ValidationViewController.h"
#import "SignupViewController.h"
#import "DataBaseHelper.h"
#import "AppDelegate.h"
#import "FMDBDataAccess.h"
#import "MBProgressHUD.h"
#import "UIView+Toast.h"

@interface LoginViewController () {
    FMDBDataAccess *dataBaseHelper;
}

@end

@implementation LoginViewController
@synthesize UserName,Password;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initV];
    dataBaseHelper = [[FMDBDataAccess alloc]init];
    UserName.text = @"xyz@gmail.com";
    Password.text = @"12345";
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)initV
{
     self.navigationItem.title=@"Login";
    
   /* UIImage * targetImage = [UIImage imageNamed:@"SignupBackground.jpg"];
    
    // redraw the image to fit |yourView|'s size
    UIGraphicsBeginImageContextWithOptions(self.testView.frame.size, NO, 0.f);
    [targetImage drawInRect:CGRectMake(0.f, 0.f, self.testView.frame.size.width, self.testView.frame.size.height)];
    UIImage * resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.testView setBackgroundColor:[UIColor colorWithPatternImage:resultImage]];*/
   
    
    
    
    
    /*
     UserName.rightViewMode = UITextFieldViewModeAlways;
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 15)];
    imageView1.image = [UIImage imageNamed:@"Email"];
    UserName.rightView = imageView1;
   
    
    //for Retriving value from NSUserDefailt.
    UserName.text= [[NSUserDefaults standardUserDefaults]
                                          stringForKey:@"UserName"];
    
    Password.rightViewMode = UITextFieldViewModeAlways;
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 15)];
    imageView2.image = [UIImage imageNamed:@"Password"];
    Password.rightView = imageView2;*/
    [_scrlView setContentOffset:CGPointMake(0, 0) animated:NO];

}

- (IBAction)Remember:(id)sender
{
    self.Remember_me.selected = !self.Remember_me.selected;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Submit:(id)sender {
 
    
    [self.view endEditing:YES];
    
    if(UserName.text.length==0){
        [self.view makeToast:@"Email address cannot be blank."];
        return;
    }
    if(Password.text.length==0){
        [self.view makeToast:@"Password cannot be blank."];
        return;
    }

    if(self.Remember_me.isSelected)
    {
        [[NSUserDefaults standardUserDefaults] setObject:UserName.text forKey:@"UserName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"UserName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    if(![ValidationViewController validateEmail:UserName.text])
    {
        [self.view makeToast:@"Please enter valid email address."];
        return;
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
//                                                        message:@"Enter Valid Email id."
//                                                       delegate:self
//                                              cancelButtonTitle:@"Ok"
//                                              otherButtonTitles: nil];
//        [alert show];
//        [UserName becomeFirstResponder];
    }
   else if(![ValidationViewController validatePassword:Password.text])
   {
       [self shakeView:self.view];
       [self.view makeToast:@"Password must be 6 character long."];
            //    [UserName becomeFirstResponder];
       return;

    }
    else if ([dataBaseHelper checkUserLogin:UserName.text andPassword:Password.text])
    {
//        [self showProgressHud];
//
//        [self hideProgressHud];
        AppDelegate *appDelegateTemp = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        appDelegateTemp.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    }
    else
    {
        [self.view makeToast:@"Please enter valid email address and password."];
        return;

    }
}


- (void)shakeView:(UIView *)view
{
    CABasicAnimation *animationOnYDirection = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animationOnYDirection.duration = 0.1;
    animationOnYDirection.byValue = @(10);
    animationOnYDirection.autoreverses = YES;
    animationOnYDirection.repeatCount = 10;
    [view.layer addAnimation:animationOnYDirection forKey:@"Shake"];
    
}

#pragma mark -
#pragma mark - ProgressHud
#pragma mark -
- (void) showProgressHud
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:NO];
        [progressHUD setLabelText:@"Please wait"];
    });
    
}

- (void) hideProgressHud
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    });
}


- (IBAction)onSignUpClicked:(id)sender {
    SignupViewController *second=(SignupViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"SignupViewController"];
    [self.navigationController pushViewController:second animated:YES];
}
@end

