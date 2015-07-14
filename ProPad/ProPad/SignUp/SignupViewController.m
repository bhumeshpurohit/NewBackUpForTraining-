//
//  SignupViewController.m
//  ProPad
//
//  Created by Bhumesh on 29/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "SignupViewController.h"
#import "ValidationViewController.h"
#import "FMDBDataAccess.h"
#import "UIView+Toast.h"
@interface SignupViewController ()
{
    BOOL isNewCustomer;
    BOOL isUsedCustomer;
}

@end

@implementation SignupViewController
@synthesize Firstname;
@synthesize Lastname;
@synthesize Username;
@synthesize Secretpin;
@synthesize company_code;
@synthesize Company_Name;
@synthesize Confirm_pin;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Registration";
    self.scroll.scrollEnabled = YES;
    [self.scroll setContentSize: CGSizeMake(420,1000)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.userview addGestureRecognizer:tap];
    
    [self initV];
    [_scroll setContentOffset:CGPointMake(0, 0) animated:NO];
    
    Firstname.delegate=self;
    Lastname.delegate=self;
    Username.delegate=self;
    Secretpin.delegate=self;
    company_code.delegate=self;
    Company_Name.delegate=self;
    Confirm_pin.delegate=self;
    
    isNewCustomer=false;
    isUsedCustomer=true;
    
    Firstname.returnKeyType=UIReturnKeyDone;
    Lastname.returnKeyType=UIReturnKeyDone;
    Username.returnKeyType=UIReturnKeyDone;
    Secretpin.returnKeyType=UIReturnKeyDone;
    company_code.returnKeyType=UIReturnKeyDone;
    Company_Name.returnKeyType=UIReturnKeyDone;
    Confirm_pin.returnKeyType=UIReturnKeyDone;
    
    // self.navigationController.navigationBarHidden=true;
    
    // Do any additional setup after loading the view.
}
-(void)initV
{
    /* UIImage * targetImage = [UIImage imageNamed:@"SignupBackground.jpg"];
     
     // redraw the image to fit |yourView|'s size
     UIGraphicsBeginImageContextWithOptions(self.userview.frame.size, NO, 0.f);
     [targetImage drawInRect:CGRectMake(0.f, 0.f, self.userview.frame.size.width, self.userview.frame.size.height)];
     UIImage * resultImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     
     [self.userview setBackgroundColor:[UIColor colorWithPatternImage:resultImage]];*/
    
    self.scroll.scrollEnabled = YES;
    [self.scroll setContentSize: CGSizeMake(2400,8000)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.userview addGestureRecognizer:tap];
}

-(void)dismissKeyboard {
    [self.userview endEditing:YES];
}



//sending mail.
//http://www.tutorialspoint.com/ios/ios_sending_email.htm

/* hide keyboard click Outside*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES]; // dismiss the keyboard
    [super touchesBegan:touches withEvent:event];
}
/* hide keyboard click Return*/
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField.tag==5)
    {
        Company_Name.text=@"Bayerische Motoren Werke(BMW)";

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//validation for Capital First Character

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSLog(@"%@",string);
//    if (Firstname.text.length==0)
//    {
//        Firstname.text=@"";
//        Firstname.text=[ValidationViewController Capital: string];
//    }
//    return YES;
//}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)checkUsedCustomer:(id)sender {
    if(isUsedCustomer==true)
    {
        isNewCustomer=true;
        isUsedCustomer=false;
        [self.used setImage:[UIImage imageNamed:@"radiobuttonChecked.png"] forState:UIControlStateNormal];
        [self.newone setImage:[UIImage imageNamed:@"radiobuttonUnChecked.png"] forState:UIControlStateNormal];
    }
    strSalesPersonType = @"Used";
}

- (IBAction)checkNewCustomer:(id)sender {
    
    if(isNewCustomer==true)
    {
        isNewCustomer=false;
        isUsedCustomer=true;
        [self.used setImage:[UIImage imageNamed:@"radiobuttonUnChecked.png"] forState:UIControlStateNormal];
        [self.newone setImage:[UIImage imageNamed:@"radiobuttonChecked.png"] forState:UIControlStateNormal];
    }
    
    strSalesPersonType = @"Newone";
}

- (IBAction)InsertCustomer:(id)sender {
    NSString *strMsg=@"";
    if(Firstname.text.length==0){
//        strMsg=@"First Name can not be blank";
//        [self dispAlrt:strMsg];
        [self.view makeToast:@"First name can not be blank"];

    }
    else if (Lastname.text.length==0)
    {
//        strMsg=@"LastName can not be blank";
//        [self dispAlrt:strMsg];
        [self.view makeToast:@"Last name can not be blank"];

    }
    else if (Username.text.length==0)
    {
//        strMsg=@"UserName can not be blank";
//        [self dispAlrt:strMsg];
        [self.view makeToast:@"User name can not be blank"];

    }
    
    else if (Secretpin.text.length==0)
    {
//        strMsg=@"SecretPin can not be blank";
//        [self dispAlrt:strMsg];
        [self.view makeToast:@"Password can not be blank"];

    }
    else if (Confirm_pin.text.length==0)
    {
//        strMsg=@"ConfirmPin can not be blank";
//        [self dispAlrt:strMsg];
        [self.view makeToast:@"Confirm password can not be blank"];

    }
    else if (![Confirm_pin.text isEqualToString:Secretpin.text])
    {
//        strMsg=@"ConfirmPin is not Same as Secret pin";
//        [self dispAlrt:strMsg];
        [self.view makeToast:@"Confirm password is not same as password password"];

    }
    else if (company_code.text.length==0)
    {
//        strMsg=@"Company Code can not be blank";
//        [self dispAlrt:strMsg];
        [self.view makeToast:@"Company code can not be blank"];

    }
    
    
    else{
        
        FMDBDataAccess *dbAccess = [FMDBDataAccess new];
        NSMutableDictionary *dict = [NSMutableDictionary new];
        [dict setValue:Firstname.text forKey:@"firstName"];
        [dict setValue:Lastname.text forKey:@"Lastname"];
        [dict setValue:Username.text forKey:@"Username"];
        [dict setValue:Secretpin.text forKey:@"Secretpin"];
        [dict setValue:company_code.text forKey:@"company_code"];
        [dict setValue:Company_Name.text forKey:@"Company_Name"];
        [dict setValue:strSalesPersonType forKey:@"salesPersonType"];
        [dbAccess insertuserData:dict];
        //[self.view makeToast:@"Do you want to save?"];

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Account Created"                                                   message:@"User data has been successfully added."
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles: nil, nil];
        [alert show];
    }
    
}
-(void)dispAlrt:(NSString*)txtmsg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"                                                   message:txtmsg
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles: nil];
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView
didDismissWithButtonIndex:(NSInteger) buttonIndex
{
    
    AppDelegate *appDelegateTemp = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    appDelegateTemp.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
