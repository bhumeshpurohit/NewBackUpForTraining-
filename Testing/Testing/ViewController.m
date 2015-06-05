//
//  ViewController.m
//  Testing
//
//  Created by Bhumesh on 18/05/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"
#import "FacebookSDK/FacebookSDK.h"
#import "FBSDKCoreKit.h"
#import <FBSDKShareKit/FBSDKShareKit.h>

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "ViewController.h"

@interface ViewController ()

-(void)toggleHiddenState:(BOOL)shouldHide;

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   //

    [self toggleHiddenState:YES];
    self.lblLoginStatus.text = @"";
    
    self.loginButton.delegate = self;
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private method implementation

-(void)toggleHiddenState:(BOOL)shouldHide{
    self.lblUsername.hidden = shouldHide;
    self.lblEmail.hidden = shouldHide;
    self.profilePicture.hidden = shouldHide;
}


#pragma mark - FBLoginView Delegate method implementation

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged in.";
    
    
}


-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    NSLog(@"%@", user);
    //self.pictureView1=[[FBSDKProfilePictureView alloc] init];
    self.pictureView=[[FBSDKProfilePictureView alloc] initWithFrame:self.profilePicture.frame];
    [self.pictureView setProfileID:@"me"];
    
    
 
   
    
//    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
//    content.contentURL = [NSURL URLWithString:@"https://developers.facebook.com"];
//    
//    FBSDKShareButton *button = [[FBSDKShareButton alloc] init];
//    button.shareContent = content;
//    [self.view addSubview:button];
//    [FBSDKShareDialog showFromViewController:self
//                                 withContent:content
//                                    delegate:nil];
   
   
    
    
    [self.pictureView setProfileID:@"me"];
    [self.pictureView setPreservesSuperviewLayoutMargins:YES];
    [self.pictureView setPictureMode:FBSDKProfilePictureModeNormal];
    [self.pictureView setNeedsImageUpdate];
    //[self getUserImageFromFBView];
    [self performSelector:@selector(pictureView1) withObject:nil afterDelay:2.0];
    self.lblUsername.text = user.name;
    self.lblEmail.text = [user objectForKey:@"email"];
  
    // sharing on facebook
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"NighBook EventDetails", @"name",
                                   @"TestTest", @"caption",
                                   @"Share Events", @"description",
                                   @"https://www.google.com", @"link",
                                   @"http://www.zaptechsolutions.com/images/logo.gif", @"picture",
                                   nil];
    
    // Make the request
    [FBRequestConnection startWithGraphPath:@"/me/feed"
                                 parameters:params
                                 HTTPMethod:@"POST"
                          completionHandler:^(FBRequestConnection *connection, id result, NSError *error){
                              if (!error) {
                                  
                                  
                                  // Link posted successfully to Facebook
                                  ///(@"result: %@", result);
                              }}];
   
    
    
    
   // FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
 //   content.contentURL = [NSURL URLWithString:@"https://developers.facebook.com"];
//    FBSDKShareButton *button = [[FBSDKShareButton alloc] init];
//        button.shareContent = content;
//    
//    [self.view addSubview:button];
    
}
     
-(void) updatePic
{
 
    [self.profilePicture setPreservesSuperviewLayoutMargins:YES];
}
-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged out";
    
    [self toggleHiddenState:YES];
}


-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
}


- (IBAction)ShareInfo:(id)sender {
    
    //use for login but currently not use in this applicxation.
    
    [self toggleHiddenState:NO];
    [FBSession openActiveSessionWithPublishPermissions:@[@"public_profile,publish_actions"] defaultAudience:FBSessionDefaultAudienceEveryone allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
        [FBSession setActiveSession:session];
        //[self sessionStateChanged:session state:status error:error];
    }];
}
@end
