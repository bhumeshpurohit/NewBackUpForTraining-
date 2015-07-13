//
//  ViewController.h
//  MyFirstDemoProject
//
//  Created by Bhumesh on 16/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextFieldValidator.h"
#import "UserViewController.h"
@interface ViewController : UIViewController

@property (nonatomic,retain)IBOutlet UIView * testView;
@property (strong, nonatomic) IBOutlet UISwitch *switchControl;
@property (strong, nonatomic) IBOutlet UIView *loginview;
- (IBAction)SignIn:(id)sender;
- (IBAction)SignUp:(id)sender;
@property (strong, nonatomic) IBOutlet TextFieldValidator *usrname;
@property (strong, nonatomic) IBOutlet TextFieldValidator *txtPassword;
@property (nonatomic,retain) UserViewController *objUserViewController;
- (IBAction)FacebookLogin:(id)sender;

@end

