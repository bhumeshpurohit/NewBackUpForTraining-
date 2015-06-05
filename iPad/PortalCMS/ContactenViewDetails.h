//
//  ContactenViewDetails.h
//  PortalCMS
//
//  Created by Etisbew on 05/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "MainView.h"
#import "ContactenClass.h"
#import "MBProgressHUD.h"
#import "ContactViewDetails.h"

@interface ContactenViewDetails : UIViewController<UIGestureRecognizerDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>
{
    UIImageView *logoImageView;
    UIImageView *userImageView;
    UILabel *labelBgView;
    UILabel *userNameLabel;
    UILabel *userEmailLabel;
    UILabel *userMobileLabel;
    UILabel *userTelePhoneLabel;
    UILabel *message;
    UILabel *usersexpertiseLabel;
    UILabel *usersfunctieLabel;
    UILabel *bgImgLabel;
    UIButton *mobileButton;
    UIButton *messageButton;
    UIButton *telePhoneButton;
    NSString *stringTitle;
    NSString *newsString;
    ContactenClass *objClass;
    ContactViewDetails *objContactDetails;
    IBOutlet UINavigationBar *navigationBar;
}
@property (nonatomic,strong) IBOutlet UIButton *telePhoneButton;
@property (nonatomic,strong) IBOutlet UIButton *mobileButton;
@property (nonatomic,strong) IBOutlet UIButton *messageButton;
@property (nonatomic,strong) IBOutlet UIImageView *logoImageView;
@property (nonatomic,strong) IBOutlet UIImageView *userImageView;
@property (nonatomic,strong) IBOutlet UILabel *userTelePhoneLabel;
@property (nonatomic,strong) IBOutlet UILabel *userMobileLabel;
@property (nonatomic, strong) IBOutlet UILabel *message;
@property (nonatomic,strong) IBOutlet UILabel *labelBgView;
@property (nonatomic,strong) IBOutlet UILabel *userNameLabel;
@property (nonatomic,strong) IBOutlet UILabel *userEmailLabel;
@property (nonatomic,strong) IBOutlet UILabel *usersexpertiseLabel;
@property (nonatomic,strong) IBOutlet UILabel *usersfunctieLabel;
@property (nonatomic,strong) IBOutlet UILabel *bgImgLabel;
@property (nonatomic,strong) NSString *stringTitle;
@property (nonatomic,strong) NSString *newsString;
@property (nonatomic,strong) ContactenClass *objClass;
@property (nonatomic,strong) ContactViewDetails *objContactDetails;

- (void) loadImageViewElements;
- (IBAction) mobileNoClicked:(id)sender;
- (IBAction) landLineNoClicked:(id)sender;
- (IBAction) emailClicked:(id)sender;
- (IBAction) backClicked:(id)sender;
- (IBAction) homeClicked:(id)sender;
- (IBAction) smsButton:(id)sender;
@end
