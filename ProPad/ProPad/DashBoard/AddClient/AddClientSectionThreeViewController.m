//
//  AddClientSectionThreeViewController.m
//  ProPad
//
//  Created by Bhumesh on 02/07/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "AddClientSectionThreeViewController.h"
#import "ActionSheetStringPicker.h"
#import "FMDBDataAccess.h"
#import "ClientListViewController.h"
#import "AddClientSectionOneViewController.h"
#import "UIView+Toast.h"
@interface AddClientSectionThreeViewController ()<UIAlertViewDelegate,UIGestureRecognizerDelegate>


@end

@implementation AddClientSectionThreeViewController

@synthesize  txtDesirePayment;
@synthesize txtNotesForSecondSec;
@synthesize scrlView;
@synthesize txtMakeModel;
@synthesize txtAddress;
@synthesize btnPhone;
@synthesize btnEmail;
@synthesize btnText;
@synthesize  txtCustType;
@synthesize  txtReference;
@synthesize  txtSecondaryChoice;
@synthesize  txtCurrentPayment;
@synthesize  txtPrimaryChoice;
@synthesize  txtNotesForFirstSec;
@synthesize txtFirstName;
@synthesize txtLastName;
@synthesize txtCity;
@synthesize txtMobile;
@synthesize txtHome;
@synthesize txtWork;
@synthesize txtEmail;
@synthesize txtCurrentMile;
@synthesize dataDictionary;
@synthesize txtCityCode;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add New Client";
    
    [scrlView setContentOffset:CGPointMake(0, 0) animated:NO];
    [scrlView setContentSize:CGSizeMake(420, 1000)];
    
    [[txtAddress layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[txtAddress layer] setBorderWidth:2.3];
    [[txtAddress layer] setCornerRadius:15];
    
    [[txtNotesForFirstSec layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[txtNotesForFirstSec layer] setBorderWidth:2.3];
    [[txtNotesForFirstSec layer] setCornerRadius:15];
    
    [self initV];
}
-(void)initV
{
    NSDate *todayDate = [NSDate date]; // get today date
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"]; //Here we can set the format which we need
    txtDate= [dateFormatter stringFromDate:todayDate];// here convert date in
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)itemWasSelected:(NSNumber *)selectedIndex element:(id)element {
    
    NSLog(@"%@",selectedIndex);
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)Selectcust_type:(id)sender {
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Select Customer Type:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"1st Time Customer ",
                            @"Be Back",
                            @"Previous Customer",
                            @"Appointment",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"Address"]||[textView.text isEqualToString:@"Notes"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
}
- (IBAction)SelectAboutus:(id)sender {
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@" How did you hear about us?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Internet",
                            @"Walk In",
                            @"Referral",
                            @"Mailer",
                            @"3rd Party Website",
                            nil];
    popup.tag = 2;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}
- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    txtCustType.text= @"1st Time Customer";
                    break;
                case 1:
                    txtCustType.text= @"Be Back";
                    break;
                case 2:
                    txtCustType.text= @"Previous Customer";
                    break;
                case 3:
                    txtCustType.text= @"Appointment";
                    break;
                default:
                    break;
            }
            break;
        }
            
        case 2: {
            switch (buttonIndex) {
                case 0:
                    txtReference.text= @"Internet";
                    break;
                case 1:
                    txtReference.text= @"Walk In";
                    break;
                case 2:
                    txtReference.text= @"Referral";
                    break;
                case 3:
                    txtReference.text= @"Mailer";
                    break;
                case 4:
                    txtReference.text= @"3rd Party Website";
                    break;
                default:
                    break;
            }
            break;
        }
        case 3: {
            switch (buttonIndex) {
                case 0:
                    txtCurrentPayment.text= @"100-200";
                    break;
                case 1:
                    txtCurrentPayment.text= @"50-100";
                    break;
                case 2:
                    txtCurrentPayment.text= @"25-50";
                    break;
                case 3:
                    txtCurrentPayment.text= @"0-25";
                    break;
                    
                default:
                    break;
            }
            break;
        }
            
        default:
            break;
    }
}
-(void)selecttext:(id)sender
{
    btnText.selected=!btnText.selected;
}
-(void)selectemail:(id)sender
{
    btnEmail.selected=!btnEmail.selected;
    
}

-(void)selectphone:(id)sender
{
    btnPhone.selected=!btnPhone.selected;
}

- (IBAction)addClientDetails:(id)sender
{
    if(txtPrimaryChoice.text.length==0){
        [self.view makeToast:@"Please enter primary choice" duration:1 position:CSToastPositionCenter title:nil];
        return;
    }
    else if(txtSecondaryChoice.text.length==0){
        [self.view makeToast:@"Please enter secondary choice" duration:1 position:CSToastPositionCenter title:nil];
        return;
    }
    
    FMDBDataAccess *dbAccess = [FMDBDataAccess new];
    
    [dataDictionary setValue:txtPrimaryChoice.text forKey:@"PrimaryChoice"];
    
    [dataDictionary setValue:txtSecondaryChoice.text forKey:@"SecondaryChoice"];
    [dataDictionary setValue:txtDate forKey:@"RegistrationDate"];
    
    NSLog(@"%@",dataDictionary);
    [dbAccess insertclientData:dataDictionary];
    // [dbAccess getClient];
    
    
    
    
    //[self.view makeToast:@"Do you want to save?"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Data Saved"                                                   message:@"Client data has been successfully added."
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles: nil, nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView
didDismissWithButtonIndex:(NSInteger) buttonIndex
{
    self.tabBarController.selectedIndex = 0;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)selectCurrentpayment:(id)sender
{
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@" How did you hear about us?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"100-200",
                            @"50-100",
                            @"25-50",
                            @"0-50",
                            nil];
    popup.tag = 3;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}

@end
