//
//  ContactenView.h
//  PortalCMS
//
//  Created by Etisbew on 05/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ContactenViewDetails.h"
#import "ContactenClass.h"
#import "MBProgressHUD.h"
#import "WebService.h"
#import "LoginView.h"

@interface ContactenView : UIViewController<UITableViewDelegate, UIGestureRecognizerDelegate, UITableViewDataSource>
{
    UIImageView *logoImageView;
    UILabel *titleLabel;
    UILabel *bgImgLabel;
    NSString *stringParams;
    UITableView *contactenDetailsTableView;
    NSMutableArray *usersNameArray;
    NSMutableArray* contactsTempArray;
    NSMutableArray *alphabetArray;
    UIActivityIndicatorView *loaderView;
    int limitCount,alimitCount;
    BOOL flag;
    BOOL aflag;
    WebService *objCallWS;
    IBOutlet UILabel *recordsTitleLabel;
    IBOutlet UILabel *outlineLabel;
    NSDictionary *sectioncount;
    NSMutableArray *sectionArray;
    NSMutableArray *fContact;
}
@property (nonatomic,retain) NSMutableArray *usersNameArray;
@property (nonatomic,strong) IBOutlet UIActivityIndicatorView *loaderView;
@property (nonatomic,strong) IBOutlet UILabel *norecord;
@property (nonatomic,strong) IBOutlet UILabel *loadingLabel;
@property (nonatomic,retain) IBOutlet UITableView *contactenDetailsTableView;
@property (nonatomic,retain) IBOutlet UITableView *alphabetTableView;
@property (nonatomic,retain) IBOutlet UIImageView *logoImageView; 
@property (nonatomic,retain) IBOutlet UILabel *titleLabel;
@property (nonatomic,strong) IBOutlet UILabel *bgImgLabel;
@property (nonatomic,assign) int limitCount;
- (void) loadImageViewElements;
@end
