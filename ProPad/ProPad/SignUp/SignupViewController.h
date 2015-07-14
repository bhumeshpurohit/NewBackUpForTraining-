//
//  SignupViewController.h
//  ProPad
//
//  Created by Bhumesh on 29/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ValidationViewController.h"
@interface SignupViewController : UIViewController <UITextFieldDelegate> {
    NSString *strSalesPersonType;
}
@property (weak, nonatomic) IBOutlet UITextField *Firstname;
@property (weak, nonatomic) IBOutlet UITextField *Lastname;
@property (weak, nonatomic) IBOutlet UITextField *Username;
@property (weak, nonatomic) IBOutlet UITextField *Secretpin;
@property (weak, nonatomic) IBOutlet UITextField *company_code;
@property (weak, nonatomic) IBOutlet UITextField *Company_Name;
@property (weak, nonatomic) IBOutlet UITextField *Confirm_pin;
@property (weak, nonatomic) IBOutlet UIView *userview;
@property (weak, nonatomic) IBOutlet UIButton *used;
@property (weak, nonatomic) IBOutlet UIButton *newone;
- (IBAction)checkNewCustomer:(id)sender;
- (IBAction)checkUsedCustomer:(id)sender;

- (IBAction)InsertCustomer:(id)sender;
-(void)initV;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
//@property (strong, nonatomic) IBOutlet UIView *testView;

@end
