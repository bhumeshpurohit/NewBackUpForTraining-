//
//  ContactenViewDetails.m
//  PortalCMS
//
//  Created by Etisbew on 05/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContactenViewDetails.h"

@interface ContactenViewDetails ()

@end

@implementation ContactenViewDetails
@synthesize logoImageView;
@synthesize userImageView;
@synthesize labelBgView;
@synthesize userNameLabel;
@synthesize userEmailLabel;
@synthesize userMobileLabel;
@synthesize usersexpertiseLabel;
@synthesize bgImgLabel;
@synthesize userTelePhoneLabel;
@synthesize usersfunctieLabel;
@synthesize stringTitle,objClass;
@synthesize newsString;
@synthesize mobileButton;
@synthesize messageButton;
@synthesize telePhoneButton;
@synthesize objContactDetails;
@synthesize message;

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
    // Do any additional setup after loading the view from its nib.
    //navigationBar.frame=CGRectMake(0,0,320,30);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    UIAppDelegate.urlString = [defaults valueForKey:@"imageurl"];
    [self loadImageViewElements];
    
    //loading the contact view details
    if ([newsString isEqualToString:@"1"]) {
        self.usersexpertiseLabel.text = self.objContactDetails.usersExpertiseString;
        self.usersfunctieLabel.text = self.objContactDetails.usersFunctieString;
        self.userNameLabel.text = self.objContactDetails.usersNameString;
        self.userEmailLabel.text = self.objContactDetails.usersEmailString;    
        objContactDetails.usersTelphoneString = [objContactDetails.usersTelphoneString stringByTrimmingCharactersInSet:
                                        [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        objContactDetails.usersMobileString = [objContactDetails.usersMobileString stringByTrimmingCharactersInSet:
                                      [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([objContactDetails.usersMobileString isEqualToString:@""]) {
            self.userMobileLabel.hidden = YES;
            self.mobileButton.hidden = YES;
            self.telePhoneButton.frame = CGRectMake(28, 223, 262, 40);
            self.userTelePhoneLabel.frame = CGRectMake(86,232,192,21);
        }
        else {
            self.userMobileLabel.hidden = NO;
            self.mobileButton.hidden = NO;
            self.userMobileLabel.text = self.objContactDetails.usersMobileString;
        }
        if ([objClass.usersExpertiseString isEqualToString:@""]) {
           // self.usersexpertiseLabel.text = @"E-business";
        }
        if ([objContactDetails.usersTelphoneString isEqualToString:@""]) {
            self.userTelePhoneLabel.hidden = YES;
            self.telePhoneButton.hidden = YES;
            self.messageButton.frame = CGRectMake(28, 223, 262, 40);
            self.userEmailLabel.frame = CGRectMake(86,232,192,21);
        }
        else {
               self.userTelePhoneLabel.hidden = NO;
               self.telePhoneButton.hidden = NO;
               self.userTelePhoneLabel.text = self.objContactDetails.usersTelphoneString;
           }
        UIAppDelegate.urlString = [NSString stringWithFormat:@"%@/%@&intra_id=%@",UIAppDelegate.urlString,objContactDetails.usersImageString,UIAppDelegate.intraidString];
        if (![objContactDetails.usersImageString isEqualToString:@""]) {
            NSString *imgstr=[objContactDetails.usersImageString substringFromIndex:[objContactDetails.usersImageString rangeOfString:@"http"].location ];
            UIImage *newsSummaryImage = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgstr]]];
            userImageView.contentMode = UIViewContentModeScaleAspectFit;
            userImageView.image=newsSummaryImage;
           // userImageView.image = [UIImage imageNamed:@"newssumImg"];
        } else {
            UIImage *newsSummaryImage = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:UIAppDelegate.urlString]]];
            userImageView.image = newsSummaryImage;
             userImageView.image = [UIImage imageNamed:@"newssumImg"];
        }
    }
     
    else {
        self.usersexpertiseLabel.text = self.objClass.usersExpertiseString;
        self.usersfunctieLabel.text = self.objClass.usersFunctieString;
        self.userNameLabel.text = objClass.usersNameString;
        self.userEmailLabel.text = self.objClass.usersEmailString; 
        objClass.usersTelphoneString = [objClass.usersTelphoneString stringByTrimmingCharactersInSet:
                                        [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        objClass.usersMobileString = [objClass.usersMobileString stringByTrimmingCharactersInSet:
                                      [NSCharacterSet whitespaceAndNewlineCharacterSet]];

        if ([objClass.usersMobileString isEqualToString:@""]) {
            self.userMobileLabel.hidden = YES;
            self.mobileButton.hidden = YES;
            self.telePhoneButton.frame = CGRectMake(28, 243, 262, 40);
            self.userTelePhoneLabel.frame = CGRectMake(86,252,192,21);
            self.messageButton.frame = CGRectMake(28, 300, 262, 40);
            self.userEmailLabel.frame = CGRectMake(86,307,192,21);
        }
        else {
                self.userMobileLabel.hidden = NO;
                self.mobileButton.hidden = NO;
                self.userMobileLabel.text = self.objClass.usersMobileString;
        }
        if ([objClass.usersExpertiseString isEqualToString:@""]) {
            self.usersexpertiseLabel.text = @"E-business";
        }
        if ([objClass.usersTelphoneString isEqualToString:@""]) {
            self.userTelePhoneLabel.hidden = YES;
            self.telePhoneButton.hidden = YES;
            self.messageButton.frame = CGRectMake(28, 223, 262, 40);
            self.userEmailLabel.frame = CGRectMake(86,232,192,21);
            self.mobileButton.frame= CGRectMake(28, 273, 262, 40);
            self.userMobileLabel.frame= CGRectMake(84, 280, self.userMobileLabel.frame.size.width, self.userMobileLabel.frame.size.height);
        }
        else {
               self.userTelePhoneLabel.hidden = NO;
               self.telePhoneButton.hidden = NO;
               self.userTelePhoneLabel.text = self.objClass.usersTelphoneString;
        }
        UIAppDelegate.urlString = [NSString stringWithFormat:@"%@/%@&intra_id=%@",UIAppDelegate.urlString,objClass.usersImageString,UIAppDelegate.intraidString];
        if (![objClass.usersImageString isEqualToString:@"" ] && [objClass.usersImageString length]>4) {
            NSString *imgstr=[objClass.usersImageString substringFromIndex:[objClass.usersImageString rangeOfString:@"http"].location ];
            UIImage *newsSummaryImage = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgstr]]];
            userImageView.contentMode = UIViewContentModeScaleAspectFit;
            userImageView.image = newsSummaryImage;
        
        } else {
            UIImage *newsSummaryImage = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:UIAppDelegate.urlString]]];
           // userImageView.image = newsSummaryImage;
            userImageView.image = [UIImage imageNamed:@"newssumImg"];
        }
    }
}

//Calling the SMS action 
- (IBAction)smsButton:(id)sender {
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText])
    {
        controller.body = @"SMS message here";
        controller.recipients = [NSArray arrayWithObjects:userMobileLabel.text, nil];
        controller.messageComposeDelegate = self;
        [self presentModalViewController:controller animated:YES];
    }
}

//Displaying sms sending result
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    UIAlertView *alert;
	switch (result) {
		case MessageComposeResultCancelled:
			break;
		case MessageComposeResultFailed:
            alert = [[UIAlertView alloc]initWithTitle:@"SMS failed" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
			break;
		case MessageComposeResultSent:
			break;
		default:
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}

//Adjusting the view frames
- (void) loadImageViewElements {
    self.userImageView.layer.cornerRadius = 10.0;
    self.userImageView.layer.masksToBounds = YES;
    self.bgImgLabel.backgroundColor = [UIColor whiteColor];
    self.bgImgLabel.layer.masksToBounds = YES;
    self.bgImgLabel.layer.cornerRadius = 10.0;
    self.labelBgView.layer.masksToBounds = YES;
    self.labelBgView.layer.cornerRadius = 6.0;
    self.labelBgView.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *itemImageTap= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backToBeforeView:)];
    itemImageTap.numberOfTapsRequired =1;
    itemImageTap.delegate = self;
    [logoImageView addGestureRecognizer:itemImageTap];
}

//Mobile number click action method
- (IBAction) mobileNoClicked:(id)sender
{
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
    NSURL *phoneNumberURL;
    if ([newsString isEqualToString:@"1"]) {
        NSString *strcal = [NSString stringWithFormat:
                                               @"tel:%@",objContactDetails.usersMobileString];
        phoneNumberURL = [NSURL URLWithString:strcal];
   
    }  else {
         NSString *strcall = [NSString stringWithFormat:@"tel:%@",objClass.usersMobileString];
         phoneNumberURL = [NSURL URLWithString:strcall];
    }
     [[UIApplication sharedApplication] openURL:phoneNumberURL];
}

//Land line number click action method
- (IBAction) landLineNoClicked:(id)sender
{
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
     NSURL *phoneNumberURL;
    if ([newsString isEqualToString:@"1"]) {
        NSString *strca = [NSString stringWithFormat:
                                                 @"tel:%@",objContactDetails.usersTelphoneString];
         phoneNumberURL = [NSURL URLWithString:strca];
   
    } else {
        NSString *strc = [NSString stringWithFormat:@"tel:%@",objClass.usersTelphoneString];
         phoneNumberURL = [NSURL URLWithString:strc];
    }
     [[UIApplication sharedApplication] openURL:phoneNumberURL];
}


////Email click action method
- (IBAction)emailClicked:(id)sender
{
    //composer email:
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		if ([mailClass canSendMail])
		{
          [self displayComposerSheet];
		}
		else
		{
          [self launchMailAppOnDevice];
		}
	}
	else
	{
      [self launchMailAppOnDevice];
	}
}

#pragma mark -
#pragma mark Compose Mail

// Displays an email composition interface inside the application. Populates all the Mail fields. 
-(void)displayComposerSheet 
{
	//Creating instance of MFMailComposeViewController
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    
	//setting delegate to self
	picker.mailComposeDelegate = self;
    
	// Setting  recipients
    NSString *str = [NSString stringWithFormat:@"%@",userEmailLabel.text];
    NSArray *toRecipients = [NSArray arrayWithObject:str];
	[picker setToRecipients:toRecipients];
    
	//setting subject of the email
	[picker setSubject:@""];
    
	// Fill out the email body text<html>
	NSString *emailBody = @"";
	[picker setMessageBody:emailBody isHTML:NO];
	[self presentModalViewController:picker animated:YES];
}


// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result1 error:(NSError*)error 
{	
	// Notifies users about errors associated with the interface
	switch (result1)
	{
		case MFMailComposeResultCancelled:
			message.text = @"Result: canceled";
			break;
		case MFMailComposeResultSaved:
			message.text = @"Result: saved";
			break;
		case MFMailComposeResultSent:
			message.text = @"Result: sent";
			break;
		case MFMailComposeResultFailed:
			message.text = @"Result: failed";
			break;
		default:
			message.text = @"Result: notsent";
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Workaround

// Launches the Mail application on the device.
-(void)launchMailAppOnDevice
{
    NSString *recipients = [NSString stringWithFormat:@"mailto:%@?&subject=",userEmailLabel.text];
	NSString *body = @"&body=Message from PortalCMS";
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

- (void) indicatorView {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

//dismiss to present view on touching logo image 
- (void)backToBeforeView:(UITapGestureRecognizer*)sender
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView~ipad" bundle:nil];
        [self presentModalViewController:objMainView animated:YES];
    }
    else{
        MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView" bundle:nil];
        [self presentModalViewController:objMainView animated:YES];
    }
    
}

//dismiss to present view on touching back button  
- (IBAction)backClicked:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

//presenting  Main view on touching Home button
- (IBAction)homeClicked:(id)sender {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView~ipad" bundle:nil];
        [self presentModalViewController:objMainView animated:YES];
    }
    else{
        MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView" bundle:nil];
        [self presentModalViewController:objMainView animated:YES];
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    /** CMS Image Code **/
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    UIAppDelegate->cmsImageURL = [defaults valueForKey:@"logo"];
    if(UIAppDelegate.cmsImageData==nil) {
       
    }    
    else {
//           logoImageView.frame=CGRectMake(110, 35, 97, 47);
           logoImageView.image=[UIImage imageWithData: UIAppDelegate.cmsImageData];
    } 
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
