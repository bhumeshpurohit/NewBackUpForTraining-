//
//  ClientDetailViewController.m
//  ProPad
//
//  Created by Bhumesh on 02/07/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ClientDetailViewController.h"
#import "FMDBDataAccess.h"
@interface ClientDetailViewController ()

@end
@implementation ClientDetailViewController
@synthesize  txtCustType;
@synthesize  txtReference;
@synthesize  txtFirstName;
@synthesize  txtLastName;
@synthesize  txtAddress;
@synthesize  txtCity;
@synthesize  txtZip;
@synthesize  txtMobile;
@synthesize  txtWork;
@synthesize  txtEmail;
@synthesize  txtPreferContact;
@synthesize  txtNote1;
@synthesize  txtMakeModel;
@synthesize  txtCurrentMonthly;
@synthesize  txtDesireMonthly;
@synthesize  txtNotes2;
@synthesize  txtPrimaryChoice;
@synthesize  txtSecondaryChoice;
@synthesize  txtCurrentMile;
@synthesize  txtHome;
@synthesize  Client;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self dispData];
    [self setTitle:@"Client Detail"];
    [self initV];
    // Do any additional setup after loading the view from its nib.
}
-(void)initV
{
    btnEdit = [[UIBarButtonItem alloc]
                                initWithTitle:@"Edit"
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(editData)];
    self.navigationItem.rightBarButtonItem = btnEdit;
    NSDate *todayDate = [NSDate date]; // get today date
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"]; //Here we can set the format which we need
    txtDate= [dateFormatter stringFromDate:todayDate];// here convert date in
    
}
-(void)editData
{
    txtCustType.enabled=true;
    txtReference.enabled=true;
    txtFirstName.enabled=true;
    txtLastName.enabled=true;
    txtAddress.enabled=true;
    txtCity.enabled=true;
    txtZip.enabled=true;
    txtMobile.enabled=true;
    txtWork.enabled=true;
    txtEmail.enabled=true;
    txtPreferContact.enabled=true;
    txtNote1.enabled=true;
    txtMakeModel.enabled=true;
    txtCurrentMonthly.enabled=true;
    txtDesireMonthly.enabled=true;
    txtNotes2.enabled=true;
    txtPrimaryChoice.enabled=true;
    txtSecondaryChoice.enabled=true;
    txtCurrentMile.enabled=true;
    txtHome.enabled=true;
    self.navigationItem.rightBarButtonItem=nil;
    
    UIBarButtonItem *btnSubmit = [[UIBarButtonItem alloc]
                                initWithTitle:@"Submit"
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(submitData)];
    self.navigationItem.rightBarButtonItem = btnSubmit;
}
-(void)submitData
{
    FMDBDataAccess *dbAccess = [FMDBDataAccess new];
  //  NSArray *clientDataArray = [dbAccess getClient];
    NSLog(@"%@",[Client objectForKey:@"ClientID"]);
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setValue:txtCustType.text forKey:@"CustType"];
    [dict setValue:txtReference.text forKey:@"Reference"];
    [dict setValue:txtFirstName.text forKey:@"FirstName"];
    [dict setValue:txtLastName.text forKey:@"LastName"];
    [dict setValue:txtAddress.text forKey:@"Address"];
    [dict setValue:txtCity.text forKey:@"City"];
    [dict setValue:txtZip.text forKey:@"Zip"];
    [dict setValue:txtMobile.text forKey:@"Mobile"];
    [dict setValue:txtHome.text forKey:@"Home"];
    [dict setValue:txtWork.text forKey:@"Work"];
    [dict setValue:txtEmail.text forKey:@"Email"];
    [dict setValue:txtNote1.text forKey:@"NotesforClient"];
    [dict setValue:txtCurrentMile.text forKey:@"CurrentMile"];
    [dict setValue:txtCurrentMonthly.text forKey:@"CurrentmonthlyPayment"];
    [dict setValue:txtDesireMonthly.text forKey:@"DesiremonthlyPayment"];
    [dict setValue:txtNotes2.text forKey:@"NotesForVehicle"];
    [dict setValue:txtPrimaryChoice.text forKey:@"PrimaryChoice"];
    
    [dict setValue:txtSecondaryChoice.text forKey:@"SecondaryChoice"];
    [dict setValue:txtDate forKey:@"RegistrationDate"];
    [dict setValue:[Client objectForKey:@"ClientID"] forKey:@"ClientID"];
    [dict setValue:[Client objectForKey:@"PreferContType"] forKey:@"PreferContType"];
    //
    
    NSLog(@"%@",dict);
    [dbAccess updateclientData:dict];
    // [dbAccess getClient];
    
    
    
    
    //[self.view makeToast:@"Do you want to save?"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Data Saved"                                                   message:@"Client data has been successfully Edited."
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles: nil, nil];
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView
didDismissWithButtonIndex:(NSInteger) buttonIndex
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)dispData
{
    
    txtCustType.text=[Client objectForKey:@"CustType"];
    txtFirstName.text=[Client objectForKey:@"FirstName"];
    txtLastName.text=[Client objectForKey:@"LastName"];
    txtAddress.text=[Client objectForKey:@"Address"];
    txtCity.text=[Client objectForKey:@"City"];
    txtZip.text=[Client objectForKey:@"Zip"];
    txtMobile.text=[Client objectForKey:@"Mobile"];
    txtHome.text=[Client objectForKey:@"Home"];
    txtWork.text=[Client objectForKey:@"Work"];
    txtEmail.text=[Client objectForKey:@"Email"];
    txtPreferContact.text=[Client objectForKey:@"PreferContType"];
    txtNote1.text=[Client objectForKey:@"NotesforClient"];
    txtMakeModel.text=[Client objectForKey:@"MakeModal"];
    txtCurrentMile.text=[Client objectForKey:@"CurrentMile"];
    txtCurrentMonthly.text=[Client objectForKey:@"CurrentmonthlyPayment"];
    txtDesireMonthly.text=[Client objectForKey:@"DesiremonthlyPayment"];
    txtNotes2.text=[Client objectForKey:@"NotesForVehicle"];
    txtPrimaryChoice.text=[Client objectForKey:@"PrimaryChoice"];
    txtSecondaryChoice.text=[Client objectForKey:@"SecondaryChoice"];
    txtReference.text=[Client objectForKey:@"Reference"];
   
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
