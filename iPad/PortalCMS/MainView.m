//
//  MainView.m
//  PortalCMS
//
//  Created by Etisbew on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"

@interface MainView ()

@end

@implementation MainView
@synthesize searchText = _searchText;
@synthesize alert = _alert;
@synthesize newsArray = _newsArray;
@synthesize searchButton;
@synthesize searchIconButton;
@synthesize logoImage;
@synthesize wikiSearchMainString;
@synthesize contactsArray;
@synthesize wikiParentArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
     AppDelegate *ap=[[UIApplication sharedApplication]delegate];
    resetf=true;
    defaults = [NSUserDefaults standardUserDefaults];
    self.contactsArray = [[NSMutableArray alloc]init];
    self.wikiParentArray = [[NSMutableArray alloc]init];
    UIAppDelegate.mobileOptionsUrl = [defaults valueForKey:@"mobileOptionsUrl"];
    objCallWS=[[WebService alloc]init];
    self.homeScrollview.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    
    
    if ([ap.SearString length]<1)
    {
        
    }else
    {
         self.searchText.text=ap.SearString;
        
        [self searchButtonClicked:nil];
        
    }
    

    [self buttonsView];
}
- (IBAction)logout:(id)sender
{
    
    [defaults setValue:@"" forKey:@"username"];
    [defaults setValue:@"" forKey:@"password"];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        LoginView *login = [[LoginView alloc] initWithNibName:@"LoginView~ipad" bundle:nil];
        [self presentModalViewController:login animated:NO];
        [self.navigationController  pushViewController:login animated:NO];
    }
    else{
        LoginView *login = [[LoginView alloc] initWithNibName:@"LoginView" bundle:nil];
        [self presentModalViewController:login animated:NO];
        [self.navigationController  pushViewController:login animated:NO];
    }
    
}
-(IBAction)logoutf:(id)sender
{
    AppDelegate *ap=[[UIApplication sharedApplication]delegate];
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
    if(![ap checkDevice])
    {
        ap.flogout=YES;
        [self logout:[[UIButton alloc] init]];
    }
    wikiSearchMainString = nil;
    UIAppDelegate.searchString = nil;
    self.searchText.text=@"";
    
    ap.SearString=@"";
    
    //scoreLabel.text =@"";
    resetf=true;
    [self buttonsView];
}
//setting the frames for Buttons and Labels
- (void) buttonsView {
    UIAppDelegate.imagevalue=0;
    wikiSearchMainString = nil;
    UIAppDelegate.searchString = nil;
    defaults = [NSUserDefaults standardUserDefaults];
    UIAppDelegate.mobileOptionsUrl = [defaults valueForKey:@"mobileOptionsUrl"];
    UIAppDelegate.deviceIdString = [defaults valueForKey:@"deviceId"];
    UIAppDelegate.intraidString = [defaults valueForKey:@"intraid"];
    UIAppDelegate.categoryIdString = [defaults valueForKey:@"categorieId"];
    UIAppDelegate.userIdString = [defaults valueForKey:@"userid"];
    UIAppDelegate.CMSUrlString = [defaults valueForKey:@"mobileurl"];
    UIAppDelegate.urlString = [defaults valueForKey:@"imageurl"];
    mobileOptionsArray  = [UIAppDelegate.mobileOptionsUrl componentsSeparatedByString:@","];
    UIImage *buttonImage;
    UIImageView *buttonImageView;
    UIButton *button;
    int y = 123;
    for (int i=0; i<[mobileOptionsArray count]; i++) {
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self 
                   action:@selector(moveToSelectButtonView:)
         forControlEvents:UIControlEventTouchDown];
        [button setTitle:@"Show View" forState:UIControlStateNormal];
      //button.frame = CGRectMake(28,y,320,40);
        
        //Edited By Bhumesh Purohit
        
        button.frame = CGRectMake(self.view.frame.origin.x+20, y, self.view.frame.size.width, self.view.frame.size.height/10);
       
        
        
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        button.contentEdgeInsets=UIEdgeInsetsMake(5,60, 0, 0);
        button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];        
        [button setTitle:[NSString stringWithFormat:@"%@",[mobileOptionsArray objectAtIndex:i]] forState:UIControlStateNormal];
        [button setTag:i];
        [button setBackgroundImage:[UIImage imageNamed:@"textbox.png"] forState:UIControlStateNormal]; 
        [self.homeScrollview addSubview:button];
       
        //Set the image to button corner
        buttonImageView =[[UIImageView alloc] initWithFrame:CGRectMake(16,7,28,28)];
        y=y+60;
        scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(150,7,45,28)];
        scoreLabel.textColor = [UIColor blackColor];
        scoreLabel.backgroundColor = [UIColor clearColor];
        scoreLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:(15.0)];
        if (!self.newsArray) {
            }
        else
        {   
        if (i == 0 && !resetf) {
             scoreLabel.text = [NSString stringWithFormat:@"(%@)",[self.newsArray objectAtIndex:0]];
           }
        else if (i == 1 && !resetf) {
                 scoreLabel.text = [NSString stringWithFormat:@"(%@)",[self.newsArray objectAtIndex:1]];
               }
        else if (i == 2 && !resetf) {
                  scoreLabel.text = [NSString stringWithFormat:@"(%@)",[self.newsArray objectAtIndex:2]];
               }
        else if (i == 3 && !resetf) {
                  wikiSearchMainString = [NSString stringWithFormat:@"(%@)",[self.newsArray objectAtIndex:3]];
                  scoreLabel.text = [NSString stringWithFormat:@"(%@)",[self.newsArray objectAtIndex:3]];
               }
        }
        if ([button.titleLabel.text isEqualToString:@"N"]) {
            [button setTitle:@"Nieuws" forState:UIControlStateNormal];
            buttonImage = [UIImage imageNamed:@"rssnew"];
            
        } else if ([button.titleLabel.text isEqualToString:@"C"]) {
            [button setTitle:@"Contacten" forState:UIControlStateNormal];
            buttonImage = [UIImage imageNamed:@"groupnew"];
            
        }  else if ([button.titleLabel.text isEqualToString:@"B"]) {
            [button setTitle:@"Blogs" forState:UIControlStateNormal];
            buttonImage = [UIImage imageNamed:@"blognew"];
            
        } else if ([button.titleLabel.text isEqualToString:@"W"]) {
            [button setTitle:@"Wiki" forState:UIControlStateNormal];
            buttonImage = [UIImage imageNamed:@"wikinew"];
        }
        [buttonImageView setImage:buttonImage];
        [button addSubview:buttonImageView];
        [button addSubview:scoreLabel];
    }
    self.searchButton.frame = CGRectMake(self.searchButton.frame.origin.x, button.frame.origin.y, self.searchButton.frame.size.width, self.searchButton.frame.size.height);
    self.searchText.frame = CGRectMake(self.searchText.frame.origin.x, button.frame.origin.y+5, self.searchText.frame.size.width, self.searchText.frame.size.height);
    self.searchIconButton.frame = CGRectMake(self.searchIconButton.frame.origin.x, button.frame.origin.y+64, self.searchIconButton.frame.size.width, self.searchIconButton.frame.size.height);
    
    UITapGestureRecognizer *portalLogoImage= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backToBeforeView:)];
    portalLogoImage.numberOfTapsRequired =1;
    portalLogoImage.delegate = self;
    [logoImage addGestureRecognizer:portalLogoImage];
}

//setting the action methods for button clicked
- (void)moveToSelectButtonView:(id)sender {
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
    UIButton *selectedButton = sender;
    NSString *stringParams;
    limitcount= 0;
    UIAppDelegate.isNetworkIsAvailable = NO;
    [UIAppDelegate internetStatus];
    [UIAppDelegate localWifi];

    //making all the arrays nil before calling the service
    if(UIAppDelegate.isNetworkIsAvailable == YES ) {
        UIAppDelegate.newsTocusArray = nil;
        UIAppDelegate.newssummaryArray = nil;
        UIAppDelegate.newstitleArray = nil;
        UIAppDelegate.newsAuthorArray = nil;
        UIAppDelegate.newsDateArray = nil;
        UIAppDelegate.newsImageArray = nil;
        UIAppDelegate.newsIdArray = nil;
        UIAppDelegate.newsuserIdArray = nil;
        UIAppDelegate.countString = nil;
         UIAppDelegate.valueArray = nil;
        
        UIAppDelegate.blogsTocusArray = nil;
        UIAppDelegate.blogssummaryArray = nil;
        UIAppDelegate.blogsTitleArray = nil;
        UIAppDelegate.blogsAuthorArray = nil;
        UIAppDelegate.blogsDateArray = nil;
        UIAppDelegate.blogsImageArray = nil;
        UIAppDelegate.blogsIdArray = nil;
        UIAppDelegate.blogsUserIdArray = nil;
    }
    
    //checking if selected button title is nieuws and Blogs
    if ([selectedButton.titleLabel.text isEqualToString:@"Nieuws"] || [selectedButton.titleLabel.text isEqualToString:@"Blogs"]) {
        UIAppDelegate.searchString = nil;
        
        //checking if selected button title is nieuws and call the nieuws service
        if ([selectedButton.titleLabel.text isEqualToString:@"Nieuws"]) {
            UIAppDelegate.searchString = self.searchText.text;
             stringParams=[NSString stringWithFormat:@"method=getLatestNews&deviceId=%@&intraid=%@&searchkeyword=%@&limit=%d&categorie=%@",UIAppDelegate.deviceIdString,UIAppDelegate.intraidString,UIAppDelegate.searchString,limitcount,UIAppDelegate.categoryIdString];
        }
        
        //checking if selected button title is Blogs and call the Blogs service
        else if ([selectedButton.titleLabel.text isEqualToString:@"Blogs"]) {
            UIAppDelegate.searchString = self.searchText.text;
              stringParams = [NSString stringWithFormat:@"method=getBlogdetail&deviceId=%@&intraid=%@&searchkeyword=%@&limit=%d&categorie=%@",UIAppDelegate.deviceIdString,UIAppDelegate.intraidString,UIAppDelegate.searchString,limitcount,UIAppDelegate.categoryIdString];
          }
          [objCallWS callNieuwsWebService:stringParams:selectedButton.titleLabel.text];
             
            //for success response navigating to NieuwsView
            if ([objCallWS.newsResponseString isEqualToString:@"success"]) {
                
                
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                    NieuwsView *objNieuwsView = [[NieuwsView alloc]initWithNibName:@"NieuwsView~ipad" bundle:nil];
                    objNieuwsView.buttonTitleString = selectedButton.titleLabel.text;
                    [self presentModalViewController:objNieuwsView animated:NO];
                }
                else{
                NieuwsView *objNieuwsView = [[NieuwsView alloc]initWithNibName:@"NieuwsView" bundle:nil];
                objNieuwsView.buttonTitleString = selectedButton.titleLabel.text;
                [self presentModalViewController:objNieuwsView animated:NO];
                    
                }
            }
        
           //for failure response navigating to LoginView
            else {
                AppDelegate *ap=(AppDelegate *)[[UIApplication sharedApplication]delegate];
                ap.flogout=true;
                
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                    LoginView *objNieuwsView = [[LoginView alloc]initWithNibName:@"LoginView~ipad" bundle:nil];
                    [self presentModalViewController:objNieuwsView animated:NO];
                }
                else{
                    LoginView *objNieuwsView = [[LoginView alloc]initWithNibName:@"LoginView" bundle:nil];
                    [self presentModalViewController:objNieuwsView animated:NO];
                }
                
                 }
         }
    
        //checking if selected button title is Contacten and call the Contacten service
        else if ([selectedButton.titleLabel.text isEqualToString:@"Contacten"]) {
                  stringParams=[NSString stringWithFormat:@"method=getUserList&deviceId=%@&intraid=%@&searchkeyword=%@&limit=%d",UIAppDelegate.deviceIdString,UIAppDelegate.intraidString,self.searchText.text,limitcount];
                UIAppDelegate.searchString = nil;
                UIAppDelegate.isNetworkIsAvailable=NO;
                [UIAppDelegate internetStatus];
                [UIAppDelegate localWifi];
                if(UIAppDelegate.isNetworkIsAvailable==NO)
                {
                }
                else {
                       UIAppDelegate.contactsArray=nil;
                }
                self.contactsArray = [objCallWS callContactenClassService:stringParams];
            
            //for success response navigating to ContactenView
            if ([UIAppDelegate.contresponseString isEqualToString:@"success"]) {
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                    ContactenView *objContactenView = [[ContactenView alloc]initWithNibName:@"ContactenView~ipad" bundle:nil];
                    UIAppDelegate.searchString = self.searchText.text;
                    objContactenView.usersNameArray = self.contactsArray;
                    [self presentModalViewController:objContactenView animated:NO];
                }
                else{
                    ContactenView *objContactenView = [[ContactenView alloc]initWithNibName:@"ContactenView" bundle:nil];
                    UIAppDelegate.searchString = self.searchText.text;
                    objContactenView.usersNameArray = self.contactsArray;
                    [self presentModalViewController:objContactenView animated:NO];
                }
                
                
                
            }
            
              //for failure response navigating to LoginView
               else {
                   AppDelegate *ap=(AppDelegate *)[[UIApplication sharedApplication]delegate];
                   ap.flogout=true;
                   if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                       LoginView *objNieuwsView = [[LoginView alloc]initWithNibName:@"LoginView~ipad" bundle:nil];
                       [self presentModalViewController:objNieuwsView animated:NO];
                   }
                   else{
                       LoginView *objNieuwsView = [[LoginView alloc]initWithNibName:@"LoginView" bundle:nil];
                       [self presentModalViewController:objNieuwsView animated:NO];
                   }
                   
                    }
         }
    
    //checking if selected button title is Wiki and call the Wiki service
        else if ([selectedButton.titleLabel.text isEqualToString:@"Wiki"]) {
                    if (self.searchText.text!=nil && [self.searchText.text length] > 0) {   
                        stringParams=[NSString stringWithFormat:@"method=getWikiSearchParent&deviceId=%@&intraid=%@&searchkeyword=%@",UIAppDelegate.deviceIdString,UIAppDelegate.intraidString,self.searchText.text];
                    }
                    else {
                           stringParams=[NSString stringWithFormat:@"method=getWikiParent&deviceId=%@&intraid=%@",UIAppDelegate.deviceIdString,UIAppDelegate.intraidString];
                    }
          self.wikiParentArray = [objCallWS callWikiParentWebService:stringParams];
            
          //for success response navigating to WikiView 
          if([objCallWS.wikiResponseString isEqualToString:@"success"]) {
              UIAppDelegate.searchString = nil;
              
              
              if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                  WikiView *objWikiView = [[WikiView alloc]initWithNibName:@"WikiView~ipad" bundle:nil];
                  UIAppDelegate.searchString = self.searchText.text;
                  objWikiView.wikisearchString = self.searchText.text;
                  objWikiView.wikiParentDetailsArray = self.wikiParentArray;
                  wikiSearchMainString = nil;
                  [self presentModalViewController:objWikiView animated:NO];
              }
              else{
                  WikiView *objWikiView = [[WikiView alloc]initWithNibName:@"WikiView" bundle:nil];
                  UIAppDelegate.searchString = self.searchText.text;
                  objWikiView.wikisearchString = self.searchText.text;
                  objWikiView.wikiParentDetailsArray = self.wikiParentArray;
                  wikiSearchMainString = nil;
                  [self presentModalViewController:objWikiView animated:NO];
              }
              
              
          }
            
            //for failure response navigating to LoginView
             else
             {
                 AppDelegate *ap=(AppDelegate *)[[UIApplication sharedApplication]delegate];
                 ap.flogout=true;
                 if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                     LoginView *objLoginView = [[LoginView alloc]initWithNibName:@"LoginView~ipad" bundle:nil];
                     [self presentModalViewController:objLoginView animated:YES];
                 }
                 else{
                     LoginView *objLoginView = [[LoginView alloc]initWithNibName:@"LoginView" bundle:nil];
                     [self presentModalViewController:objLoginView animated:YES];
                 }
                 
             }
     }
}

//Creating an action event for  search button
- (IBAction)searchButtonClicked:(id)sender
{
    self.newsArray = [[NSMutableArray alloc]init];
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
    NSString *stringParams;
    resetf=false;
    
     AppDelegate *ap=[[UIApplication sharedApplication]delegate];
    
    
    
  
    
    
    //calling the search web service
    if ([self.searchText.text length] == 0)
    {
        stringParams=[NSString stringWithFormat:@"method=getTotalcount&deviceId=%@&intraid=%@&searchkeyword=&categorie=%@",UIAppDelegate.deviceIdString,UIAppDelegate.intraidString,UIAppDelegate.categoryIdString];
        
    } else if ([self.searchText.text length] > 0)
    {
        NSString *trimmed = [self.searchText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        stringParams=[NSString stringWithFormat:@"method=getTotalcount&deviceId=%@&intraid=%@&searchkeyword=%@&categorie=%@",UIAppDelegate.deviceIdString,UIAppDelegate.intraidString,trimmed,UIAppDelegate.categoryIdString];
        ap.SearString=[NSString stringWithFormat:@"%@",trimmed];
       
    }
    self.newsArray = [objCallWS callMobileSearchService:stringParams];
    
    //for success response showing the required response data on buttons
    if ([objCallWS.strResponse isEqualToString:@"success"]) {
        [self buttonsView];
        [searchText resignFirstResponder];
    }
    
    //for failure response navigating to LoginView
    else {
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            LoginView *objLogin = [[LoginView alloc]initWithNibName:@"LoginView~ipad" bundle:nil];
            [self presentModalViewController:objLogin animated:NO];
        }
        else{
            LoginView *objLogin = [[LoginView alloc]initWithNibName:@"LoginView" bundle:nil];
            [self presentModalViewController:objLogin animated:NO];
        }
        
    }
}

//clearing the search response from the view 
- (void)backToBeforeView:(UITapGestureRecognizer*)sender
{
    if (self.newsArray !=nil) {
        self.newsArray = nil;
    }
    self.searchText.text = @"";
    [self buttonsView];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	if(textField == self.searchText)
	{
//        self.view.frame = CGRectMake(0,0,320,480);
        [self.homeScrollview setContentOffset:CGPointZero];
        
        
	}
    [textField resignFirstResponder];
	return YES;
}
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    self.homeScrollview.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+ kbSize.height);
    [self.homeScrollview setContentOffset:CGPointMake(0, kbSize.height) animated:YES];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    self.homeScrollview.contentSize = CGSizeMake(self.view.frame.size.width, self.logoImage.frame.size.height + 127 + self.view.frame.size.height);
    
	if (textField == self.searchText) {
//		self.view.frame = CGRectMake(0,-127,320,480);
        
//        [self.homeScrollview setContentOffset:CGPointMake(0, self.logoImage.frame.origin.y + self.logoImage.frame.size.height + 127)];
        
	}
	return YES;
}

- (void) indicatorView {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

//setting the default values from response
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    AppDelegate *ap=[[UIApplication sharedApplication] delegate];
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
    if(![ap checkDevice])
    {
        ap.flogout=YES;
        [self logout:[[UIButton alloc] init]];
    }
    defaults = [NSUserDefaults standardUserDefaults];
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:UIAppDelegate.userIdString forKey:@"userid"];
    [defaults setValue:UIAppDelegate.deviceIdString forKey:@"deviceId"];
    [defaults setValue:UIAppDelegate.intraidString forKey:@"intraid"];
    [defaults setValue:UIAppDelegate.urlString forKey:@"imageurl"];
    [self.homeScrollview setContentOffset:CGPointMake(0, 0)];
    UIAppDelegate.mobileOptionsUrl =[defaults valueForKey:@"mobileOptionsUrl"];
    UIAppDelegate.cmsImageData=[defaults valueForKey:@"imagedata"];
    UIAppDelegate->cmsImageURL = [defaults valueForKey:@"logo"];
    if(UIAppDelegate.cmsImageData==nil) {
    }
    else {
           logoImage.image=[UIImage imageWithData:UIAppDelegate.cmsImageData];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload
{
    logoImage = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
@end
