//
//  AppDelegate.h
//  PortalCMS
//
//  Created by Etisbew on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "LoginView.h"

@class ViewController;
@class LoginView;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    //Globar Variables Used in NSUSerDefaults
    NSString *CMSUrlString,*urlString,*categoryIdString;
    NSString *deviceIdString,*intraidString,*userIdString;
   
    //Globar Variables Used in Webservices
    NSString *searchString,*countString,*wikiDescString;
    NSMutableArray *newsTocusArray,*wikiChildArray;
    NSMutableArray *wikiIdArray;
    NSString *strname,*responseString;
    NSString *contresponseString;
    
    //Global Variables for Images
    NSData *cmsImageData;
    @public NSString* cmsImageURL;
    @public UIImageView *cmsImage;
    
    //Checked for Network connection Class
    Reachability *reachability;
    BOOL isNetworkIsAvailable;
   
    NSMutableArray *contactsArray;
    
    //Global Variables Arrays for News Data
    NSMutableArray *newssummaryArray,*newstitleArray;
    NSMutableArray *newsAuthorArray,*newsDateArray;
    NSMutableArray *newsImageArray,*newsIdArray;
    NSMutableArray *newsuserIdArray,*valueArray;
    NSMutableArray *datepostArray;
    
    //Global Variables Arrays for Blogs Data
    NSMutableArray *blogsTitleArray,*blogsIdArray;
    NSMutableArray *blogsAuthorArray,*blogsDateArray;
    NSMutableArray *blogsImageArray,*blogsUserIdArray;
    NSMutableArray *blogsTocusArray,*blogssummaryArray;
    
    //Global Variable to store UUID
    NSString *uuid;
    
    //Temporary Variables
    NSString *mobileOptionsUrl;
    int imagevalue;
    NSString* loginvalue;
    
    //Temporary Variables for Blogs Data in case of No Network
    NSMutableArray *tempblogsTitleArray,*tempblogsIdArray;
    NSMutableArray *tempblogsAuthorArray,*tempblogsDateArray;
    NSMutableArray *tempblogsImageArray,*tempblogsUserIdArray;
    NSMutableArray *tempblogsTocusArray,*tempblogssummaryArray;
    
    //Temporary Variables for Nieuws Data in case of no Network
    NSMutableArray *tempnewsTitleArray,*tempnewsIdArray;
    NSMutableArray *tempnewsAuthorArray,*tempnewsDateArray;
    NSMutableArray *tempnewsImageArray,*tempnewsUserIdArray;
    NSMutableArray *tempnewsTocusArray,*tempnewssummaryArray;
    
    //Temporary Variables for UserName and Password to check the condition in UIAppDelegate
    UITextField *tempuserNameText;
    UITextField *temppasswordText;
    LoginView *objLoginView;
    
}
//Properties for Globar Variables Used in Webservices
@property (nonatomic,strong) NSString *contresponseString;

@property (nonatomic,retain) NSString *SearString;
@property (nonatomic,strong) NSString *responseString; 
@property (nonatomic,strong) NSString *strname;

//Property for Temporary Variables for UserName and Password to check the condition in UIAppDelegate
@property (nonatomic,strong) UITextField *tempuserNameText;
@property (nonatomic,strong) UITextField *temppasswordText;

//Properties for Temporary Variables for Nieuws Data in case of No Network
@property (strong, nonatomic) NSMutableArray *tempnewsTitleArray;
@property (strong, nonatomic) NSMutableArray *tempnewsIdArray;
@property (strong, nonatomic) NSMutableArray *tempnewsAuthorArray;
@property (strong, nonatomic) NSMutableArray *tempnewsDateArray;
@property (strong, nonatomic) NSMutableArray *tempnewsImageArray;
@property (strong, nonatomic) NSMutableArray *tempnewsUserIdArray;
@property (strong, nonatomic) NSMutableArray *tempnewsTocusArray;
@property (strong, nonatomic) NSMutableArray *tempnewssummaryArray;

//Properties for checking conditions incase of login and other validations
@property (assign) NSString* loginvalue;
@property (assign) int imagevalue;

//Properties for Temporary Variables for Blogs Data in case of No Network
@property (strong, nonatomic) NSMutableArray *tempblogsTitleArray;
@property (strong, nonatomic)  NSMutableArray *tempblogsIdArray;
@property (strong, nonatomic) NSMutableArray *tempblogsAuthorArray;
@property (strong, nonatomic) NSMutableArray *tempblogsDateArray;
@property (strong, nonatomic) NSMutableArray *tempblogsImageArray;
@property (strong, nonatomic) NSMutableArray *tempblogsUserIdArray;
@property (strong, nonatomic) NSMutableArray *tempblogsTocusArray;
@property (strong, nonatomic) NSMutableArray *tempblogssummaryArray;

//Properties for Variables for Blogs Data 
@property (strong, nonatomic) NSMutableArray *blogsIdArray;
@property (strong, nonatomic) NSMutableArray *blogsAuthorArray;
@property (strong, nonatomic) NSMutableArray *blogsDateArray;
@property (strong, nonatomic) NSMutableArray *blogsImageArray;
@property (strong, nonatomic) NSMutableArray *blogsUserIdArray;
@property (strong, nonatomic) NSMutableArray *blogsTocusArray;
@property (strong, nonatomic) NSMutableArray *blogssummaryArray;
@property (strong, nonatomic) NSMutableArray *blogsTitleArray;

//Properties for Variables for comments Data 
@property (strong, nonatomic) NSMutableArray *valueArray;
@property (strong, nonatomic) NSMutableArray *datepostArray;

//Properties for Variables for Nieuws Data 
@property (strong, nonatomic) NSMutableArray *newsIdArray;
@property (strong, nonatomic) NSMutableArray *newsuserIdArray;
@property (strong, nonatomic) NSMutableArray *newsImageArray;
@property (strong, nonatomic) NSMutableArray *newstitleArray;
@property (strong, nonatomic) NSMutableArray *newsAuthorArray;
@property (strong, nonatomic) NSMutableArray *newsDateArray;
@property (strong, nonatomic) NSMutableArray *newssummaryArray;
@property (strong, nonatomic) NSMutableArray *newsTocusArray;

//Properties for Variables for Wiki Data 
@property (strong, nonatomic) NSString *wikiDescString;
@property (strong, nonatomic) NSMutableArray *wikiIdArray;
@property (strong, nonatomic) NSMutableArray *wikiChildArray;

//Property for Variable for contacts Data 
@property (strong, nonatomic) NSMutableArray *contactsArray;

//Global Variables for Images
@property (strong, nonatomic)  NSData *cmsImageData;
@property (strong, nonatomic)  NSString *urlString;
@property (strong, nonatomic)  NSString *CMSUrlString;

//Properties for Default Views 
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) LoginView *objLoginView;

//Properties for Checking Network Availability
@property (nonatomic) BOOL isNetworkIsAvailable;
@property (strong, nonatomic)  Reachability *reachability;

//properties for Globar Variables for Forming Required URL
@property (strong, nonatomic) NSString *countString;
@property (strong, nonatomic) NSString *searchString;
@property (strong, nonatomic) NSString *categoryIdString;
@property (strong, nonatomic) NSString *deviceIdString;
@property (strong, nonatomic) NSString *intraidString;
@property (strong, nonatomic) NSString *userIdString;
@property (strong, nonatomic) NSString *mobileOptionsUrl;
@property ( nonatomic) BOOL flogout;
//Method for setting logo image
-(void)callImageData:(NSString*)imageURL;

//Methods for Checking Network and Wifi Availability
- (NetworkStatus)internetStatus;
- (NetworkStatus)localWifi;

//Method for UUID
+ (NSString *)GetUUID;
+ (NSString *)GenerateUUID;
-(BOOL) checkActivation;
-(BOOL) checkDevice;
@end
