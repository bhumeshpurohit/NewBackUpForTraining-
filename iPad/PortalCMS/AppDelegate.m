	//
//  AppDelegate.m
//  PortalCMS
//
//  Created by Etisbew on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize objLoginView = _objLoginView;
@synthesize loginvalue=_loginValue;
@synthesize categoryIdString ,deviceIdString;
@synthesize intraidString,searchString;
@synthesize countString,userIdString;
@synthesize wikiIdArray,newsTocusArray;
@synthesize wikiChildArray,blogsTocusArray;
@synthesize reachability;
@synthesize CMSUrlString,urlString;
@synthesize cmsImageData;
@synthesize isNetworkIsAvailable;
@synthesize contactsArray;
@synthesize wikiDescString,strname;
@synthesize newssummaryArray;
@synthesize newstitleArray;
@synthesize newsAuthorArray;
@synthesize newsDateArray;
@synthesize newsImageArray;
@synthesize newsIdArray;
@synthesize newsuserIdArray;
@synthesize valueArray;
@synthesize datepostArray;
@synthesize blogsTitleArray;
@synthesize blogsIdArray,blogsAuthorArray;
@synthesize blogsDateArray,blogssummaryArray;
@synthesize blogsImageArray,blogsUserIdArray;
@synthesize mobileOptionsUrl;
@synthesize imagevalue;
@synthesize tempblogsTitleArray,tempblogsIdArray;
@synthesize tempblogsAuthorArray,tempblogsDateArray;
@synthesize tempblogsImageArray,tempblogsUserIdArray;
@synthesize tempblogsTocusArray,tempblogssummaryArray;
@synthesize tempnewsTitleArray,tempnewsIdArray;
@synthesize tempnewsAuthorArray,tempnewsDateArray;
@synthesize tempnewsImageArray,tempnewsUserIdArray;
@synthesize tempnewsTocusArray,tempnewssummaryArray;
@synthesize tempuserNameText,temppasswordText;
@synthesize responseString,contresponseString;
@synthesize SearString;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Added by Aadil Keshwani to solve UUID issue of iOS 6
    if(![[NSUserDefaults standardUserDefaults] objectForKey:@"uuid"])
    {
        uuid=[AppDelegate GenerateUUID];
        [[NSUserDefaults standardUserDefaults] setObject:uuid forKey:@"uuid"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else{
        uuid=[AppDelegate GetUUID];
    }
    UIAppDelegate.deviceIdString=[AppDelegate GetUUID];
    //Setting the Login Value to 0 when the App First Launches
    loginvalue=@"0";
    self.flogout=false;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
 
    //Navigating to activationscreen in case of no activation Code entered, Which means for the first time
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    if([[defaults valueForKey:@"activeCodeText"] isEqualToString:@""])
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            self.viewController = [[ViewController alloc] initWithNibName:@"ViewController~ipad" bundle:nil];
        } else {
            self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        }
        self.window.rootViewController = self.viewController;
    }
    else if ((![[defaults objectForKey:@"username"] isEqual:[NSNull null] ] ) && ( [[defaults objectForKey:@"username"] length] != 0 ) ) {
        
        if([self checkActivation])
        {
            if(![self checkDevice])
            {
                [defaults setValue:@"" forKey:@"username"];
                [defaults setValue:@"" forKey:@"password"];
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                    LoginView *login = [[LoginView alloc] initWithNibName:@"LoginView~ipad" bundle:nil];
                    self.window.rootViewController = login;
                } else {
                    LoginView *login = [[LoginView alloc] initWithNibName:@"LoginView" bundle:nil];
                    self.window.rootViewController = login;
                }
               // LoginView *login = [[LoginView alloc] initWithNibName:@"LoginView" bundle:nil];
                
            }
            else{
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                    MainView *main=[[MainView alloc] initWithNibName:@"MainView~ipad" bundle:nil];
                    self.window.rootViewController = main;
                }
                else{
                    MainView *main=[[MainView alloc] initWithNibName:@"MainView" bundle:nil];
                    self.window.rootViewController = main;
                }
            }
          
        }
        else{
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                self.viewController = [[ViewController alloc] initWithNibName:@"ViewController~ipad" bundle:nil];
                self.window.rootViewController = self.viewController;
            }
            else
            {
                self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
                self.window.rootViewController = self.viewController;
            }
        }
        //[defaults setValue:passwordText.text forKey:@"password"];
    }
    else
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            self.viewController = [[ViewController alloc] initWithNibName:@"ViewController~ipad" bundle:nil];
            self.window.rootViewController = self.viewController;
        }
        else{
            self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
            self.window.rootViewController = self.viewController;
        }
        
    }
    NSString* valueatlogin=[defaults objectForKey:@"appstart"];
    
    // Navigating to Login View in case of Already Entered activation Code
     if([valueatlogin isEqualToString:@"1"])
     {       
        LoginView *loginView;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            loginView = [[LoginView alloc]initWithNibName:@"LoginView~ipad" bundle:nil];
        }
        else{
         loginView = [[LoginView alloc]initWithNibName:@"LoginView" bundle:nil];
        }
        self.window.rootViewController=loginView;
        loginvalue=@"1";
    }
    
    self.SearString=[[NSString alloc]init];
    
    [self.window makeKeyAndVisible];
    
   
    return YES;
}

/**********Check the internetStatus*********/
- (NetworkStatus)internetStatus
{
	reachability=[Reachability sharedReachability];
	NetworkStatus internetStatus=[reachability internetConnectionStatus];
	if(internetStatus==NotReachable)
	{
	}
	else
    {
      isNetworkIsAvailable=YES;
    }
	return internetStatus;
}

/***********Check the localWifi Status***************/
- (NetworkStatus)localWifi
{
	reachability=[Reachability sharedReachability];
	NetworkStatus wifiStatus=[reachability localWiFiConnectionStatus];
	if(wifiStatus==NotReachable)
	{
	}
	else
    {
        isNetworkIsAvailable =YES;
	}
	
	return wifiStatus;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [self callImageData:cmsImageURL];
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    //setting the default login value which is stored after login
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString* valueatlogin=[defaults objectForKey:@"appstart"];
    
    if([valueatlogin length]==0)
    {
        loginvalue=@"0";
    }
    else {
           loginvalue=valueatlogin;
    }
    //Checking the required credentials to enter in to login screen
    if(self.viewController.activeCodeText.text!=nil&&  tempuserNameText.text == nil && tempuserNameText==nil)
        {
            if(tempuserNameText.text != nil && temppasswordText.text != nil)
             {
                //Navigating to the login Screen
                LoginView *loginview=[[LoginView alloc]init];
                loginview.userNameText.text=@"";
                loginview.passwordText.text=@"";
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Username and pwd nill" message:@"USERNAME ANDD" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                LoginView *loginView;
                 if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                     loginView = [[LoginView alloc]initWithNibName:@"LoginView~ipad" bundle:nil];
                 }
                 else{
                loginView = [[LoginView alloc]initWithNibName:@"LoginView" bundle:nil];
                 }
                self.window.rootViewController=loginView;
                loginvalue=@"1";
            }
     }
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [self callImageData:cmsImageURL];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    //clearing the credentials  and setting the default login values when App terminated
    tempuserNameText.text = @"";
    tempuserNameText.text = nil;
    temppasswordText.text = @"";
    temppasswordText.text = nil;
    loginvalue=@"1";
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"deviceId"];
    [[NSUserDefaults standardUserDefaults]synchronize ];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:loginvalue forKey:@"appstart"];
    [defaults synchronize];
}
   //Method for setting logo image
-(void)callImageData:(NSString*)imageURL {
    
    cmsImageData=[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
}

/******************* Get UUDID ***************************/
// Source : http://stackoverflow.com/questions/6993325/uidevice-uniqueidentifier-deprecated-what-to-do-now
+ (NSString *)GenerateUUID {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge NSString *)string;
}
/******************* Generate UUDID ***************************/
+ (NSString *)GetUUID {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"uuid"];
}
-(BOOL) checkDevice
{
    BOOL check=false;
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    NSString *stringParams=[NSString stringWithFormat:@"method=checkdeviceid&deviceId=%@",UIAppDelegate.deviceIdString];
    WebService *objCallWS=[[WebService alloc]init];
    NSString *responseCheckUserClass = [objCallWS callCheckDeviceService:stringParams];
    
    //setting the userdefaults credentials required for success response
    if((![responseCheckUserClass isEqual:[NSNull null] ] ) && ( [responseCheckUserClass length] != 0 ) && [responseCheckUserClass intValue]!=0)
    {
        check=true;
        UIAppDelegate.userIdString = responseCheckUserClass;
    }
    
    return check;
}
-(BOOL) checkActivation
{
    BOOL check=false;
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *stringParams=[NSString stringWithFormat:@"method=checkactivationcode&activationcode=%@",[defaults valueForKey:@"activeCodeText"]];
    UIAppDelegate.mobileOptionsUrl = nil;
    WebService *objCallWS=[[WebService alloc]init];
    ActivationClass *responseActivateDetails = [objCallWS callActivationCodeService:stringParams];
    UIAppDelegate.categoryIdString = responseActivateDetails.categorieIdString;
    UIAppDelegate.urlString = responseActivateDetails.mobileurlString;
    UIAppDelegate.CMSUrlString = responseActivateDetails.mobileurlString;
    UIAppDelegate.CMSUrlString = [NSString stringWithFormat:@"%@/mobileService.cfc?",UIAppDelegate.CMSUrlString];
    UIAppDelegate.mobileOptionsUrl = responseActivateDetails.mobileOptionsString;
    NSString *imageUrl;
    imageUrl=[responseActivateDetails.mobileurlString stringByAppendingString:@"/logo/logo.jpg"];
    UIAppDelegate->cmsImageURL=imageUrl;
    [UIAppDelegate callImageData:imageUrl];
    if ([responseActivateDetails.responseString isEqualToString:@"success"]) {
        UIAppDelegate.strname = UIAppDelegate.CMSUrlString;
        defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue:UIAppDelegate.CMSUrlString forKey:@"activeurl"];
        [defaults setValue:[defaults valueForKey:@"activeCodeText"] forKey:@"url"];
        [defaults setValue:[defaults valueForKey:@"activeCodeText"] forKey:@"activeCodeText"];
        [defaults setValue:UIAppDelegate.mobileOptionsUrl forKey:@"mobileOptionsUrl"];
        [defaults setValue:responseActivateDetails.intraidString forKey:@"intraid"];
        [defaults setValue:UIAppDelegate.deviceIdString forKey:@"deviceId"];
        [defaults setValue:UIAppDelegate.categoryIdString forKey:@"categorieId"];
        [defaults setValue:UIAppDelegate.CMSUrlString forKey:@"mobileurl"];
        [defaults setValue:UIAppDelegate.urlString forKey:@"imageurl"];
        [defaults setValue:imageUrl forKey:@"logo"];
        [defaults setValue:UIAppDelegate.cmsImageData forKey:@"imagedata"];
        [defaults synchronize];
        LoginView *objLoginView = [[LoginView alloc]initWithNibName:@"LoginView" bundle:nil];
        UIAppDelegate.intraidString = responseActivateDetails.intraidString;
        check=true;
        return check;
        //[self presentModalViewController:objLoginView animated:NO];
        //Replacement for code should be [self.navigationController presentViewController:objLoginView animated:NO completion:nil];
    }
    else {
        return check;
        //Showing the alert view in case of wrong activation code
//        self.alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Activation code is not valid" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [self.alert show];
    }
}

@end
