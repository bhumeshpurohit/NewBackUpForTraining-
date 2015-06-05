//
//  LoginView.h
//  PortalCMS
//
//  Created by Etisbew on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MainView.h"
#import "WebService.h"
#import "CheckUserClass.h"
#import "MBProgressHUD.h"
#import "NieuwsView.h"

@interface LoginView : UIViewController
{
    UITextField *userNameText;
    UITextField *passwordText;
    UIAlertView *alert;
    IBOutlet UIImageView *cmsImage;
    NSUserDefaults *defaults;
}
@property (strong, nonatomic) IBOutlet UIImageView *cmsImage;
@property (nonatomic,strong) IBOutlet UITextField *userNameText;
@property (nonatomic,strong) IBOutlet UITextField *passwordText;
@property (nonatomic,strong) UIAlertView *alert;

@property IBOutlet UIView *view_log;
@property (retain, nonatomic) IBOutlet UIScrollView *scrlView;



- (void) textFieldPaddingElements;
- (void) textFieldElements;
- (IBAction) moveToMainView:(id)sender;
@end
