//
//  ViewController.m
//  LoginDemo2
//
//  Created by Bhumesh on 22/05/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
   [self.view addSubview:loginButton];
    [self toggleHiddenState:NO];
  
    self.lblLoginStatus.text = @"";
    
    self.loginButton.delegate = self;
    self.loginButton.readPermissions = @[@"public_profile", @"email",];
    
    
    
}
-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged in.";
    
    [self toggleHiddenState:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)toggleHiddenState:(BOOL)shouldHide{
    self.lblUsername.hidden = shouldHide;
    self.lblEmail.hidden = shouldHide;
    self.pictureView.hidden = shouldHide;
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    NSLog(@"%@", user);
    self.pictureView=[[FBProfilePictureView alloc] init];
    
    [self.pictureView setProfileID:@"me"];
    [self.pictureView setPreservesSuperviewLayoutMargins:YES];
    [self.pictureView setPictureCropping:FBProfilePictureCroppingOriginal];
    [self.pictureView setNeedsLayout];
    
//    self.profilePicture.profileID = user.objectID;
//    self.lblUsername.text = user.name;
//    self.lblEmail.text = [user objectForKey:@"email"];
}


-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged out";
    
    [self toggleHiddenState:YES];
}


@end
