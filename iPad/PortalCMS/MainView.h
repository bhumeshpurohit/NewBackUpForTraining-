//
//  MainView.h
//  PortalCMS
//
//  Created by Etisbew on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NieuwsView.h"
#import "ContactenView.h"
#import "WikiView.h"
#import "MBProgressHUD.h"
#import "MobileSearchClass.h"
#import "LoginView.h"

@interface MainView : UIViewController<UIGestureRecognizerDelegate>
{
  UITextField *searchText;
  UIAlertView *alert;
  NSMutableArray *newsArray;
  UIButton *searchButton;
  NSString *mobileOptionsUrl;
  UILabel *scoreLabel;
  UIButton *searchIconButton;
  UIImageView *logoImage;
  NSUserDefaults *defaults;
  NSString *wikiSearchMainString;
  NSMutableArray *contactsArray;
  NSMutableArray *wikiParentArray;
  NSArray *mobileOptionsArray;
  int limitcount;
  WebService *objCallWS;
  BOOL resetf;
}
@property (nonatomic,strong) NSMutableArray *wikiParentArray;
@property (nonatomic,strong) NSMutableArray *contactsArray;
@property (nonatomic,strong) NSMutableArray *newsArray;
@property (nonatomic,strong) NSString *wikiSearchMainString;
@property (nonatomic,strong) IBOutlet UIImageView *logoImage;
@property (nonatomic,strong) IBOutlet UIButton *searchIconButton;
@property (nonatomic,strong) IBOutlet UIButton *searchButton;
@property (nonatomic,strong) IBOutlet UITextField *searchText;
@property (weak, nonatomic) IBOutlet UIScrollView *homeScrollview;
@property (nonatomic,strong) UIAlertView *alert;
- (void) buttonsView;
- (IBAction)searchButtonClicked:(id)sender;
@end
