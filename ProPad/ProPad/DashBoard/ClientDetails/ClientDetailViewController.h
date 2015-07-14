//
//  ClientDetailViewController.h
//  ProPad
//
//  Created by Bhumesh on 02/07/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClientDetailViewController : UIViewController
{

    UIBarButtonItem *btnEdit;
     NSString *txtDate;
}
@property NSDictionary* Client;
@property (weak, nonatomic) IBOutlet UITextField *txtCustType;
@property (weak, nonatomic) IBOutlet UITextField *txtReference;
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtAddress;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtZip;

@property (weak, nonatomic) IBOutlet UITextField *txtMobile;
@property (weak, nonatomic) IBOutlet UITextField *txtWork;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPreferContact;
@property (weak, nonatomic) IBOutlet UITextField *txtNote1;
@property (weak, nonatomic) IBOutlet UITextField *txtMakeModel;
@property (weak, nonatomic) IBOutlet UITextField *txtCurrentMonthly;
@property (weak, nonatomic) IBOutlet UITextField *txtDesireMonthly;
@property (weak, nonatomic) IBOutlet UITextField *txtNotes2;
@property (weak, nonatomic) IBOutlet UITextField *txtPrimaryChoice;
@property (weak, nonatomic) IBOutlet UITextField *txtCurrentMile;
@property (weak, nonatomic) IBOutlet UITextField *txtHome;

@property (weak, nonatomic) IBOutlet UITextField *txtSecondaryChoice;
-(void)dispData;
-(void)editData;
-(void)initV;
-(void)submitData;
@end
