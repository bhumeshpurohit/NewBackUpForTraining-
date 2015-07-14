//
//  ViewController.h
//  ProPad
//
//  Created by Bhumesh on 29/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ValidationViewController.h"
#import "RadioButton.h"
@interface LoginViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UIView *testView;

@property (weak, nonatomic) IBOutlet UITextField *Password;
- (IBAction)Submit:(id)sender;
-(void)initV;
- (IBAction)Remember:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *Remember_me;
@property(nonatomic,strong)IBOutlet UIScrollView *scrlView;
//- (IBAction)Signup:(id)sender;
- (IBAction)onSignUpClicked:(id)sender;



@end

