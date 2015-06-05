//
//  LoginView.m
//  PortalCMS
//
//  Created by Etisbew on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()

@end

@implementation LoginView

@synthesize cmsImage;
@synthesize userNameText = _userNameText;
@synthesize passwordText = _passwordText;
@synthesize alert = _alert;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view_log setHidden:NO];
    defaults=[NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    
    NSString *Log=[defaults objectForKey:@"username"];
    
    
     if (( ![[defaults objectForKey:@"username"] isEqual:[NSNull null]] ) && ([[defaults objectForKey:@"username"] length]>0))
     {
         [self.view_log setHidden:NO];
        
     }
     else
     {
         [self.view_log setHidden:YES];
         
     }
    AppDelegate *ap=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    if(ap.flogout)
    {
        [self.view_log setHidden:YES];
    }
    
    self.scrlView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    
    // Do any additional setup after loading the view from its nib.
    UIAppDelegate.CMSUrlString = [defaults valueForKey:@"mobileurl"];
    [self textFieldPaddingElements];
    [self textFieldElements];
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    
    defaults=[NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
    AppDelegate *ap=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (![[defaults objectForKey:@"username"] isEqualToString:@""] && !ap.flogout) {
        
        NSString *stringParams=[NSString stringWithFormat:@"method=checkuser&username=%@&password=%@&deviceId=%@&intraId=%@",[defaults objectForKey:@"username"],[defaults objectForKey:@"password"],UIAppDelegate.deviceIdString,UIAppDelegate.intraidString];
        WebService *objCallWS=[[WebService alloc]init];
        CheckUserClass *responseCheckUserClass = [objCallWS callCheckUserService:stringParams];
        UIAppDelegate.userIdString = responseCheckUserClass.userIdString;
        
        //setting the userdefaults credentials required for success response
        if ([responseCheckUserClass.responseString isEqualToString:@"success"])
        {
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
            else
            {
                [defaults setValue:@"" forKey:@"username"];
                [defaults setValue:@"" forKey:@"password"];
                
            }
        }
        else{
            [defaults setValue:@"" forKey:@"username"];
            [defaults setValue:@"" forKey:@"password"];
            
        }
        //[defaults setValue:passwordText.text forKey:@"password"];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    UIAppDelegate.deviceIdString=[AppDelegate GetUUID];
    UIAppDelegate.loginvalue=@"1";
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:UIAppDelegate.loginvalue forKey:@"appstart"];
    [defaults synchronize];
    self.userNameText.text = @"";
    self.passwordText.text = @"";
    /** CMS Image Code **/
    UIAppDelegate.mobileOptionsUrl =[defaults valueForKey:@"mobileOptionsUrl"];
     UIAppDelegate.cmsImageData = [defaults valueForKey:@"imagedata"];
     UIAppDelegate.CMSUrlString = [defaults valueForKey:@"mobileurl"];
     UIAppDelegate.intraidString = [defaults valueForKey:@"intraid"];
    [defaults setValue:UIAppDelegate->cmsImageURL forKey:@"logo"];
    if(UIAppDelegate.cmsImageData == nil) {
    }    
    else {
           cmsImage.image=[UIImage imageWithData: UIAppDelegate.cmsImageData];
         }
    

}

//Loading the view elements and adjusting the frames
- (void) textFieldElements
{
    //userName text
    [self.passwordText setSecureTextEntry:YES];
    self.userNameText.layer.cornerRadius=6.0f;
    self.userNameText.layer.masksToBounds=YES;
    self.userNameText.layer.borderColor=[[UIColor orangeColor]CGColor];
    self.userNameText.layer.borderWidth= 2.0f; 
    //Password text
    self.passwordText.layer.cornerRadius=6.0f;
    self.passwordText.layer.masksToBounds=YES;
    self.passwordText.layer.borderColor=[[UIColor orangeColor]CGColor];
    self.passwordText.layer.borderWidth= 2.0f;
}

//Loading the view elements and adjusting the padding for textviews
- (void) textFieldPaddingElements {
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 20)];
    userNameText.leftView = paddingView;
    userNameText.leftViewMode = UITextFieldViewModeAlways;
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 20)];
    passwordText.leftView = paddingView1;
    passwordText.leftViewMode = UITextFieldViewModeAlways;
}

//Action method for navigating to main view
- (IBAction)moveToMainView:(id)sender
{
    //UIAppDelegate.deviceIdString = [[UIDevice currentDevice] uniqueIdentifier];
    UIAppDelegate.deviceIdString=[AppDelegate GetUUID];
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
  
    //verifying username and password are not empty
    if ([self.userNameText.text length] == 0 )
    {
        self.alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Gebruikersnaam is leeg" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[self.alert show]; 
        
    } else  if ([self.passwordText.text length] == 0 ) {
        self.alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Wachtwoord is leeg" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[self.alert show]; 
    
    }
    //if user name and password not empty calling checkuser service and verifying credentials
    else if ([self.userNameText.text length] > 0 && [self.passwordText.text length] > 0) {
        NSString *stringParams=[NSString stringWithFormat:@"method=checkuser&username=%@&password=%@&deviceId=%@&intraId=%@",self.userNameText.text,self.passwordText.text,UIAppDelegate.deviceIdString,UIAppDelegate.intraidString];
        WebService *objCallWS=[[WebService alloc]init];
        CheckUserClass *responseCheckUserClass = [objCallWS callCheckUserService:stringParams];
        UIAppDelegate.userIdString = responseCheckUserClass.userIdString;
        
        //setting the userdefaults credentials required for success response
        if ([responseCheckUserClass.responseString isEqualToString:@"success"]) {
            if ([UIAppDelegate.userIdString length] > 1) {
                defaults = [NSUserDefaults standardUserDefaults];
                [defaults setValue:self.userNameText.text forKey:@"username"];
                [defaults setValue:self.passwordText.text forKey:@"password"];
                UIAppDelegate.tempuserNameText.text = userNameText.text;
                UIAppDelegate.temppasswordText.text = passwordText.text;
                [defaults setValue:UIAppDelegate.userIdString forKey:@"userid"];
                [defaults setValue:UIAppDelegate.deviceIdString forKey:@"deviceId"];
                [defaults setValue:UIAppDelegate.intraidString forKey:@"intraid"];
                [defaults setValue:UIAppDelegate.urlString forKey:@"imageurl"];
                [defaults synchronize];
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                    MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView~ipad" bundle:nil];
                    [self presentModalViewController:objMainView animated:NO];
                }
                else{
                    MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView" bundle:nil];
                    [self presentModalViewController:objMainView animated:NO];
                }
                
            }
            //Displaying valid alert for failure response
            else {
                   self.alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Wrong username and password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                   [self.alert show];
                 }

            }  else {
                    if (objCallWS.statuscode == 302 ) {
                    self.alert = [[UIAlertView alloc]initWithTitle:@"" message:@"No network connection" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [self.alert show];
            }
            else {
                   self.alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Wrong username and password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                   [self.alert show];
                }
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.scrlView setContentOffset:CGPointZero];

//    self.view.frame = CGRectMake(0,0,320,480);
//self.scrlView.frame =CGRectMake(0,0,320,480);
	[textField resignFirstResponder];
	return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    self.view.frame = CGRectMake(0,-67,320,480);
//    self.scrlView.frame =CGRectMake(0,-67,320,480);
    self.scrlView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 100);
    
    
    
    if (textField.tag == 1) {
    
        [self.scrlView setContentOffset:CGPointMake(0, self.userNameText.frame.origin.y - 50)];
        
    } else{
        [self.scrlView setContentOffset:CGPointMake(0, self.userNameText.frame.origin.y - 40)];    }
	return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload
{
    cmsImage = nil;
    [self setCmsImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
