//
//  NieuwsView.h
//  PortalCMS
//
//  Created by Etisbew on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "NieuwsCustomCell.h"
#import "NieuwsViewDetails.h"
#import "WebService.h"
#import "MBProgressHUD.h"
#import "ContactenViewDetails.h"
#import "IconDownloader.h"
#import "LoginView.h"
#import "MainView.h"
#import "ContactenClass.h"
#import "ContactViewDetails.h"
@class IconDownloader;
BOOL flag;

@interface NieuwsView : UIViewController<UIGestureRecognizerDelegate,IconDownloaderDelegate>
{
  UIImageView *logoImageView;
  UILabel *titleLabel;
  UIAlertView *alert; 
  UILabel *loadingLabel;
  UILabel *bgImgLabel;
  UITableView *nieuwsDetailsTableView;
  NSMutableArray *nieuwsDetailsArray;
  NSMutableDictionary *imageDownloadsInProgress;
  NSUserDefaults *defaults;
  UIActivityIndicatorView *loaderView;
  NSString *buttonTitleString;
  int selectButtonTag;
  int limitCount;
  IBOutlet UILabel *recordsLabel;
  IBOutlet UILabel *outlineLabel;
  NieuwsCustomCell *cell;
  WebService *objCallWS;
  ContactenClass *objClass;
}
@property (nonatomic,retain) NSString *buttonTitleString;
@property (nonatomic,retain) NSMutableDictionary *imageDownloadsInProgress;
@property (nonatomic,strong) NSMutableArray *nieuwsDetailsArray;
@property (nonatomic,strong) IBOutlet UITableView *nieuwsDetailsTableView;
@property (nonatomic,strong) IBOutlet UIImageView *logoImageView; 
@property (nonatomic,strong) IBOutlet UILabel *titleLabel;
@property (nonatomic,strong) IBOutlet UIActivityIndicatorView *loaderView;
@property (nonatomic,strong) IBOutlet UILabel *loadingLabel;
@property (nonatomic,strong) IBOutlet UILabel *bgImgLabel;
@property (nonatomic,strong) UIAlertView *alert; 
@property (nonatomic,assign) int limitCount;
@property (nonatomic,assign) int selectButtonTag;
@property (nonatomic,strong) ContactenClass *objClass;
@property (nonatomic,strong) ContactViewDetails *objContactDetails;

- (void) loadImageViewElements;
- (void) loadActivityView;
- (void)appImageDidLoad:(NSIndexPath *)indexPath :(UIImage*)image;
- (NSString *)kv_decodeHTMLCharacterEntities;
@end
