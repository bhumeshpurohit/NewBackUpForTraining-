//
//  ViewController.h
//  Testing
//
//  Created by Bhumesh on 18/05/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookSDK/FacebookSDK.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
@interface ViewController : UIViewController <FBLoginViewDelegate>


@property (weak, nonatomic) IBOutlet FBLoginView *loginButton;

@property (weak, nonatomic) IBOutlet UILabel *lblLoginStatus;

@property (weak, nonatomic) IBOutlet UILabel *lblUsername;
- (IBAction)ShareInfo:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblEmail;

@property IBOutlet UIImageView *profilePicture;
@property FBSDKProfilePictureView *pictureView;
@property IBOutlet FBSDKProfilePictureView *pictureView1;
@end

