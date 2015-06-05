//
//  NieuwsViewDetails.h
//  PortalCMS
//
//  Created by Etisbew on 05/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MainView.h"
#import "NieuwsClass.h"
#import "MBProgressHUD.h"
#import "WebService.h"
#import "CommentsClass.h"
#import "ContactenViewDetails.h"
#import "ContactViewDetails.h"

@interface NieuwsViewDetails : UIViewController<UIGestureRecognizerDelegate,UITextViewDelegate,UIWebViewDelegate>
{
  UIImageView *logoImageView;
  UILabel *newsTitleLabel;
  UILabel *newsDatePublishedLabel;
  UIButton *newsAuthorButton;
  UIImageView *newsSummaryImageView;
  UIScrollView * scrollView;
  UITextView *commentsText;
  UILabel *commentsTitleLabel;
  UIButton *saveButton;  
  UILabel *bgLabel;
  UILabel *bgCommenteLabel;
  NSMutableArray *commentsDetailsArray;
  NSMutableArray *valuesArray;
  NSMutableArray *datePostsArray;
  NSMutableArray *userImagesArray;
  NSString *newsIdString;
  UIAlertView *alert;
  UITableView *commentsTableView;
  UILabel *bgImgLabel;
  NSString *newsTocusString;
  UIWebView *webview;
  NSString *newsUserId;
  NSString *newsDateString;
  NSString *newsAuthorString;
  NSString *newsTitleString;
  NSString *newsImageString;
  NieuwsClass *objNieuwsClass;
  WebService *objCallWS;
  int rowCount;
  int loadFlag;
  int webViewHeight;
  BOOL load;
  IBOutlet UINavigationBar *navigationBar;
}
@property (nonatomic,strong) NSString *newsImageString;
@property (nonatomic,strong) NSString *newsTitleString;
@property (nonatomic,strong) NSString *newsDateString;
@property (nonatomic,strong) NSString *newsAuthorString;
@property (nonatomic,strong) NSString *newsUserId;
@property (nonatomic,strong) NSString *newsIdString;
@property (nonatomic,strong) NSString *newsTocusString;
@property (nonatomic,strong) UIAlertView *alert;
@property (nonatomic,strong) IBOutlet UILabel *bgLabel;
@property (nonatomic,strong) IBOutlet UILabel *bgCommenteLabel;
@property (nonatomic,strong) IBOutlet UILabel *commentsTitleLabel;
@property (nonatomic,strong) IBOutlet UILabel *newsTitleLabel;
@property (nonatomic,strong) IBOutlet UILabel *newsDatePublishedLabel;
@property (nonatomic,strong) IBOutlet UILabel *bgImgLabel;
@property (nonatomic,strong) IBOutlet UITableView *commentsTableView;
@property (nonatomic,strong) IBOutlet UIButton *saveButton;
@property (nonatomic,strong) IBOutlet UITextView *commentsText;
@property (nonatomic,strong) IBOutlet UIImageView *logoImageView;
@property (nonatomic,strong) IBOutlet UIImageView *newsSummaryImageView;
@property (nonatomic,strong) IBOutlet UIButton *newsAuthorButton;
@property (nonatomic,strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) IBOutlet UIWebView *webview;
@property (nonatomic,strong) NSMutableArray *commentsDetailsArray;
@property (nonatomic,strong) NSMutableArray *valuesArray;
@property (nonatomic,strong) NSMutableArray *datePostsArray;
@property (nonatomic,strong) NSMutableArray *userImagesArray;
@property (nonatomic,strong) NieuwsClass *objNieuwsClass;

- (void) callFileSaveWebService;
- (void) loadImageViewElements;
- (IBAction)enterComments:(id)sender;
- (IBAction)backClicked:(id)sender;
- (IBAction)homeClicked:(id)sender;
@end
