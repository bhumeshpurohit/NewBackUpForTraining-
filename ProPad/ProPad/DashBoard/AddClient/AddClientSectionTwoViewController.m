//
//  AddClientSectionTwoViewController.m
//  ProPad
//
//  Created by Bhumesh on 02/07/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "AddClientSectionTwoViewController.h"
#import "AddClientSectionThreeViewController.h"
#import "ActionSheetStringPicker.h"
#import "FMDBDataAccess.h"
#import "UIView+Toast.h"
@interface AddClientSectionTwoViewController ()<UIAlertViewDelegate,UIGestureRecognizerDelegate>


@end

@implementation AddClientSectionTwoViewController

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
    
    NSLog(@"%@",dataDictionary);
    self.title = @"Add New Client";
    
    
    [scrlView setContentOffset:CGPointMake(0, 0) animated:NO];
    [scrlView setContentSize:CGSizeMake(420, 1000)];
    
    [[txtAddress layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[txtAddress layer] setBorderWidth:2.3];
    [[txtAddress layer] setCornerRadius:15];
    txtNotesForSecondSec.delegate=self;
    [[txtNotesForSecondSec layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[txtNotesForSecondSec layer] setBorderWidth:2.3];
    [[txtNotesForSecondSec layer] setCornerRadius:15];
}


-(void)viewWillDisappear:(BOOL)animated
{
    self.title = @"Back";
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
                    txtCurrentPayment.text= [NSString stringWithFormat:@"%@",@"100-200"];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES]; // dismiss the keyboard
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)addClientDetails:(id)sender
{
    FMDBDataAccess *dbAccess = [FMDBDataAccess new];
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setValue:txtCustType.text forKey:@"CustType"];
    [dict setValue:txtReference.text forKey:@"Reference"];
    [dict setValue:txtFirstName.text forKey:@"FirstName"];
    [dict setValue:txtLastName.text forKey:@"LastName"];
    [dict setValue:txtAddress.text forKey:@"Address"];
    [dict setValue:txtCity.text forKey:@"City"];
    [dict setValue:txtCityCode.text forKey:@"Zip"];
    [dict setValue:txtMobile.text forKey:@"Mobile"];
    [dict setValue:txtHome.text forKey:@"Home"];
    [dict setValue:txtWork.text forKey:@"Work"];
    [dict setValue:txtEmail.text forKey:@"Email"];
    [dict setValue:txtNotesForFirstSec.text forKey:@"NotesforClient"];
    [dict setValue:txtMakeModel.text forKey:@"MakeModal"];
    [dict setValue:txtCurrentMile.text forKey:@"CurrentMile"];
    
    
    [dict setValue:txtCurrentPayment.text forKey:@"CurrentmonthlyPayment"];
    
    [dict setValue:txtDesirePayment.text forKey:@"DesiremonthlyPayment"];
    
    [dict setValue:txtNotesForSecondSec.text forKey:@"NotesForVehicle"];
    
    
    
    [dict setValue:txtPrimaryChoice.text forKey:@"PrimaryChoice"];
    
    [dict setValue:txtSecondaryChoice.text forKey:@"SecondaryChoice"];
    
    [dbAccess insertclientData:dict];
    [dbAccess getClient];
    
    
    //[self.view makeToast:@"Do you want to save?"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"                                                   message:@"Do You Want to Save?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles: @"Save", nil];
    [alert show];
}
- (void)viewDidAppear:(BOOL)animated
{
    self.title = @"Add New Client";
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

- (IBAction)onNextClicked:(id)sender {
    if(txtMakeModel.text.length==0){
        [self.view makeToast:@"Please enter makeModel" duration:1 position:CSToastPositionCenter title:nil];
        return;
    }
    else if(txtCurrentMile.text.length==0){
        [self.view makeToast:@"Please select current miles"];
        return;
    }
    else if(txtCurrentPayment.text.length==0){
        [self.view makeToast:@"Please enter current payment"];
        return;
    }
    [dataDictionary setValue:txtMakeModel.text forKey:@"MakeModal"];
    [dataDictionary setValue:txtCurrentMile.text forKey:@"CurrentMile"];
    [dataDictionary setValue:txtCurrentPayment.text forKey:@"CurrentmonthlyPayment"];
    [dataDictionary setValue:txtDesirePayment.text forKey:@"DesiremonthlyPayment"];
    [dataDictionary setValue:txtNotesForSecondSec.text forKey:@"NotesForVehicle"];
    AddClientSectionThreeViewController *third=(AddClientSectionThreeViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"AddClientSectionThreeViewController"];
    third.dataDictionary = [[NSMutableDictionary alloc] init];
    third.dataDictionary = dataDictionary;
    [self.navigationController pushViewController:third animated:YES];
}
@end
