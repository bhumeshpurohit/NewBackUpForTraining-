//
//  ViewController.h
//  PortalCMS
//
//  Created by Etisbew on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "LoginView.h"
#import "WebService.h"
#import "ActivationClass.h"
#import "MainView.h"
#import "MBProgressHUD.h"

@interface ViewController : UIViewController
{
    UITextField *activeCodeText;
    UIAlertView *alert;
    NSString *mobileOptionsUrl;
    IBOutlet UIImageView *cmsImage;
    NSString *cmsImageURL;
    NSData *cmsImageData;
    NSString* imageUrl;
    NSUserDefaults *defaults;
    NSString *stractiveUrl;
}
@property (nonatomic,strong) NSString *mobileOptionsUrl;
@property (nonatomic,strong) IBOutlet UITextField *activeCodeText;
@property (nonatomic,strong) UIAlertView *alert;
- (void) textFieldElements;
- (void) moveToLogin;
- (IBAction) moveToLoginView:(id)sender;
@end
