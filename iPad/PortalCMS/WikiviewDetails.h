//
//  WikiviewDetails.h
//  PortalCMS
//
//  Created by Etisbew on 05/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MainView.h"
#import "WikiParentClass.h"
#import "MBProgressHUD.h"
#import "WebService.h"
#import "LoadWebView.h"
#import "WebService.h"

@interface WikiviewDetails : UIViewController<UIGestureRecognizerDelegate,UITextViewDelegate,UIWebViewDelegate >
{
    UIImageView *logoImageView;
    UILabel *bgImgLabel;
    NSString *descString;
    NSString *titleString;
    UILabel *selectTitleLabel;
    UIScrollView *scrollView;
    UITextView *commentsText;
    UILabel *commentsTitleLabel;
    UITableView *commentsTableView;
    NSMutableArray *commentsDetailsArray;
    UIButton *saveButton;
    WebService *objCallWS;
    UIAlertView *alert;
    NSString *treeId;
    UILabel *bgLabel;
    UILabel *bgCommenteLabel;
    int rowCount;
    NSString* htmlString;
    UIWebView *webview;
    NSString *strDesc;
    BOOL load;
    int loadFlag;
    NSString *strWikiSearch;
    IBOutlet UINavigationBar *navBar;
}
@property (strong, nonatomic) NSString *strWikiSearch;
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) NSString* htmlString;
@property (nonatomic,strong)  NSString *treeId,*strDesc;
@property (nonatomic,strong) UIAlertView *alert;
@property (nonatomic,strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) NSString *titleString;
@property (nonatomic,strong) NSString *descString;
@property (nonatomic,strong) IBOutlet UILabel *bgImgLabel;
@property (nonatomic,retain) IBOutlet UIImageView *logoImageView; 
@property (nonatomic,retain) IBOutlet UILabel *bgLabel;
@property (nonatomic,retain) IBOutlet UILabel *bgCommenteLabel;
@property (nonatomic,strong) IBOutlet UILabel *selectTitleLabel;
@property (nonatomic,strong) IBOutlet UITableView *commentsTableView;
@property (nonatomic,strong) IBOutlet UITextView *commentsText;
@property (nonatomic,strong) IBOutlet UILabel *commentsTitleLabel;
@property (nonatomic,strong) IBOutlet UIButton *saveButton;
@property (nonatomic,strong) NSMutableArray *commentsDetailsArray;

-(IBAction)backClicked:(id)sender;
- (IBAction)enterComments:(id)sender;
- (IBAction)homeClicked:(id)sender;
- (void) layerElements;
@end
