//
//  ViewController.m
//  PortalCMS
//
//  Created by Etisbew on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize activeCodeText =_activeCodeText;
@synthesize alert = _alert;
@synthesize mobileOptionsUrl;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIAppDelegate.mobileOptionsUrl = nil;
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,6, 20)];
    self.activeCodeText.leftView = paddingView;
    self.activeCodeText.leftViewMode = UITextFieldViewModeAlways;
    
    //setting the userdefaults credentials required
    defaults = [NSUserDefaults standardUserDefaults];
    self.activeCodeText.text=[defaults valueForKey:@"activeCodeText"];
    UIAppDelegate.deviceIdString = [defaults valueForKey:@"deviceId"];
    self.activeCodeText.text = [defaults valueForKey:@"activeCodeText"];
    UIAppDelegate.userIdString = [defaults valueForKey:@"userid"];
    [defaults setValue:UIAppDelegate.userIdString forKey:@"userid"];
    UIAppDelegate.mobileOptionsUrl =[defaults valueForKey:@"mobileOptionsUrl"];
    stractiveUrl =[defaults valueForKey:@"activeurl"];
    
    //If active code text is not empty moveToLogin method for other verification
     if (![self.activeCodeText.text isEqualToString:@""]) {
         [self moveToLogin];
      }
    
    //if the top condition fails then it loads the view elements. 
     else if (self.activeCodeText.text ==nil) {         
              [self textFieldElements];
    }
}
//setting the logo image method
-(void)viewWillAppear:(BOOL)animated {
    //Changed by Aadil Keshwani
    [self textFieldElements];
    defaults = [NSUserDefaults standardUserDefaults];
    if([self.activeCodeText.text isEqualToString:@""])
    {
      defaults = [NSUserDefaults standardUserDefaults];
      imageUrl=[defaults valueForKey:@"logo"];
      UIAppDelegate.cmsImageData=[defaults valueForKey:@"imagedata"];
      cmsImageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:cmsImageURL]];
        if(cmsImageData==nil) {
        }
        else {
           cmsImage.image=[UIImage imageWithData:cmsImageData];
        }
    }
    else if (![[defaults objectForKey:@"username"] isEqualToString:@""] && ![[defaults objectForKey:@"password"] isEqualToString:@""]) {
        
        NSString *stringParams=[NSString stringWithFormat:@"method=checkuser&username=%@&password=%@&deviceId=%@&intraId=%@",[defaults objectForKey:@"username"],[defaults objectForKey:@"password"],UIAppDelegate.deviceIdString,UIAppDelegate.intraidString];
        WebService *objCallWS=[[WebService alloc]init];
        CheckUserClass *responseCheckUserClass = [objCallWS callCheckUserService:stringParams];
        UIAppDelegate.userIdString = responseCheckUserClass.userIdString;
        
        //setting the userdefaults credentials required for success response
        if ([responseCheckUserClass.responseString isEqualToString:@"success"]) {
            if ([UIAppDelegate.userIdString length] > 1) {
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                    MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView~ipad" bundle:nil];
                    [self presentModalViewController:objMainView animated:NO];
                }
                else{
                MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView" bundle:nil];
                [self presentModalViewController:objMainView animated:NO];
                }
            }
            else{
                [defaults setValue:@"" forKey:@"username"];
                [defaults setValue:@"" forKey:@"password"];
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                    LoginView *objLoginView = [[LoginView alloc]initWithNibName:@"LoginView~ipad" bundle:nil];
                    [self presentModalViewController:objLoginView animated:NO];
                }
                else{
                LoginView *objLoginView = [[LoginView alloc]initWithNibName:@"LoginView" bundle:nil];
                [self presentModalViewController:objLoginView animated:NO];
                }
            }
        }
        else{
            [defaults setValue:@"" forKey:@"username"];
            [defaults setValue:@"" forKey:@"password"];
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                LoginView *objLoginView = [[LoginView alloc]initWithNibName:@"LoginView~ipad" bundle:nil];
                [self presentModalViewController:objLoginView animated:NO];
            }
            else{
            LoginView *objLoginView = [[LoginView alloc]initWithNibName:@"LoginView" bundle:nil];
            [self presentModalViewController:objLoginView animated:NO];
            }
        }
        //[defaults setValue:passwordText.text forKey:@"password"];
    }
    else  {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            LoginView *objLoginView = [[LoginView alloc]initWithNibName:@"LoginView~ipad" bundle:nil];
            [self presentModalViewController:objLoginView animated:NO];
        }
        else{
            LoginView *objLoginView = [[LoginView alloc]initWithNibName:@"LoginView" bundle:nil];
            [self presentModalViewController:objLoginView animated:NO];
        }
        
          }
}
  //navigating to the Login View
- (void) pushSecondController {
    if (self.activeCodeText.text!=nil) {
        if ([UIAppDelegate.userIdString length] > 0 && UIAppDelegate.userIdString!=nil) {
        }
        //Changed by Aadil Keshwani
        else if ([UIAppDelegate.userIdString length] <= 0 && UIAppDelegate.userIdString==nil && [self.activeCodeText.text length] > 0) {
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                LoginView *objLoginView = [[LoginView alloc]initWithNibName:@"LoginView~ipad" bundle:nil];
                [self presentModalViewController:objLoginView animated:NO];
            }
            else{
                LoginView *objLoginView = [[LoginView alloc]initWithNibName:@"LoginView" bundle:nil];
                [self presentModalViewController:objLoginView animated:NO];
            }
            
        }
    }
}
  //Loading the view elements and adjusting the frames
- (void) textFieldElements
{
    self.activeCodeText.layer.cornerRadius=6.0f;
    self.activeCodeText.layer.masksToBounds=YES;
    self.activeCodeText.layer.borderColor=[[UIColor orangeColor]CGColor];
   // self.activeCodeText.borderStyle=[U]
    self.activeCodeText.layer.borderWidth= 2.0f;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.layer.cornerRadius=8.0f;
    textField.layer.masksToBounds=YES;
    textField.layer.borderColor=[[UIColor redColor]CGColor];
    textField.layer.borderWidth= 1.0f;
    return YES;
}
//move to the login method
- (IBAction)moveToLoginView:(id)sender
{
   [self moveToLogin];
    [self.activeCodeText resignFirstResponder];
}

-(void) moveToLogin {
    
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
    if ([self.activeCodeText.text length] == 0)
       {
        self.alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Activation code is empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [self.alert show];
    }
    //calling the login service,verify and storing the response
    else if ([self.activeCodeText.text length] > 0 )
    {
        NSString *stringParams=[NSString stringWithFormat:@"method=checkactivationcode&activationcode=%@",self.activeCodeText.text];
        UIAppDelegate.mobileOptionsUrl = nil;
        WebService *objCallWS=[[WebService alloc]init];
        ActivationClass *responseActivateDetails = [objCallWS callActivationCodeService:stringParams];
        UIAppDelegate.categoryIdString = responseActivateDetails.categorieIdString;
        UIAppDelegate.urlString = responseActivateDetails.mobileurlString;
        UIAppDelegate.CMSUrlString = responseActivateDetails.mobileurlString;
        UIAppDelegate.CMSUrlString = [NSString stringWithFormat:@"%@/mobileService.cfc?",UIAppDelegate.CMSUrlString];
        UIAppDelegate.mobileOptionsUrl = responseActivateDetails.mobileOptionsString;
        imageUrl=[responseActivateDetails.mobileurlString stringByAppendingString:@"/logo/logo.jpg"];
        UIAppDelegate->cmsImageURL=imageUrl;
        [UIAppDelegate callImageData:imageUrl];
        if ([responseActivateDetails.responseString isEqualToString:@"success"]) {
            UIAppDelegate.strname = UIAppDelegate.CMSUrlString;
            defaults = [NSUserDefaults standardUserDefaults];
            [defaults setValue:UIAppDelegate.CMSUrlString forKey:@"activeurl"];
            [defaults setValue:self.activeCodeText.text forKey:@"url"];
            [defaults setValue:self.activeCodeText.text forKey:@"activeCodeText"];
            [defaults setValue:UIAppDelegate.mobileOptionsUrl forKey:@"mobileOptionsUrl"];
            [defaults setValue:responseActivateDetails.intraidString forKey:@"intraid"];
            [defaults setValue:UIAppDelegate.deviceIdString forKey:@"deviceId"];
            [defaults setValue:UIAppDelegate.categoryIdString forKey:@"categorieId"];
            [defaults setValue:UIAppDelegate.CMSUrlString forKey:@"mobileurl"];
            [defaults setValue:UIAppDelegate.urlString forKey:@"imageurl"];
            [defaults setValue:imageUrl forKey:@"logo"];
            [defaults setValue:UIAppDelegate.cmsImageData forKey:@"imagedata"];
            [defaults synchronize];
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            LoginView *objLoginView = [[LoginView alloc]initWithNibName:@"LoginView~ipad" bundle:nil];
                UIAppDelegate.intraidString = responseActivateDetails.intraidString;
                [self presentModalViewController:objLoginView animated:NO];
            }
            else{
              LoginView *objLoginView = [[LoginView alloc]initWithNibName:@"LoginView" bundle:nil];
                UIAppDelegate.intraidString = responseActivateDetails.intraidString;
                [self presentModalViewController:objLoginView animated:NO];
            }
            
            //Replacement for code should be [self.navigationController presentViewController:objLoginView animated:NO completion:nil];
        }
        else {
            //Showing the alert view in case of wrong activation code
            self.alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Activation code is not valid" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [self.alert show];
        }
    }
}

//showing the loader view method
- (void) indicatorView {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

- (void) viewDidAppear:(BOOL)paramAnimated{
    [super viewDidAppear:paramAnimated];
    [self performSelector:@selector(pushSecondController) withObject:nil afterDelay:0.0f];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{   
    [textField resignFirstResponder];
	 return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    [[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationPortrait];
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload
{
    cmsImage = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
