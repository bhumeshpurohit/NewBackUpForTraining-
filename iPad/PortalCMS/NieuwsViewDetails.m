//
//  NieuwsViewDetails.m
//  PortalCMS
//
//  Created by Etisbew on 05/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NieuwsViewDetails.h"
#import "LoadWebView.h"


@interface NieuwsViewDetails ()
{
    long vheight;
}
@property IBOutlet UIBarButtonItem *home,*back;
@property UIToolbar *tipToolbar;
@end

@implementation NieuwsViewDetails
@synthesize newsTitleLabel;
@synthesize bgLabel;
@synthesize bgCommenteLabel;
@synthesize bgImgLabel;
 @synthesize commentsTitleLabel;
@synthesize newsDatePublishedLabel;
@synthesize newsSummaryImageView;
@synthesize logoImageView;
@synthesize newsAuthorButton;
@synthesize saveButton;
@synthesize newsIdString;
@synthesize newsUserId;
@synthesize newsTocusString;
@synthesize newsDateString;
@synthesize newsAuthorString;
@synthesize newsTitleString;
@synthesize newsImageString;
@synthesize commentsText; 
@synthesize scrollView;
@synthesize objNieuwsClass;
@synthesize commentsDetailsArray;
@synthesize valuesArray;
@synthesize userImagesArray;
@synthesize datePostsArray;
@synthesize alert,webview;
@synthesize commentsTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+self.commentsText.frame.size.height+10)];
    [_home setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont fontWithName:@"Helvetica" size:16.0], NSFontAttributeName,
                                        [UIColor blackColor], NSForegroundColorAttributeName,
                                        nil] 
                              forState:UIControlStateNormal];
    [_back setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                   [UIFont fontWithName:@"Helvetica" size:16.0], NSFontAttributeName,
                                   [UIColor blackColor], NSForegroundColorAttributeName,
                                   nil]
                         forState:UIControlStateNormal];
    // Do any additional setup after loading the view from its nib.
//     navigationBar.frame=CGRectMake(0,0,320,30);
    load = false;
    self.commentsDetailsArray = [[NSMutableArray alloc]init];
    
    //loading the user defaults from login view
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    UIAppDelegate.deviceIdString=[defaults valueForKey:@"deviceId"];
    UIAppDelegate.intraidString=[defaults valueForKey:@"intraid"];
    UIAppDelegate.categoryIdString=[defaults valueForKey:@"categorieId"];
    UIAppDelegate.userIdString=[defaults valueForKey:@"userid"];
    UIAppDelegate.CMSUrlString = [defaults valueForKey:@"mobileurl"];
    UIAppDelegate.urlString = [defaults valueForKey:@"imageurl"];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    [self callFileSaveWebService];
    webview.delegate=self;
    loadFlag=0;
    
    [self loadImageViewElements];
    
    
    self.tipToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 50)];
    
    self.tipToolbar.barStyle = UIBarStyleDefault;
    //[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(ToolBarCancelClicked:)],
    self.tipToolbar.items = [NSArray arrayWithObjects:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(ToolBarDoneClicked:)], nil];
    
    [self.tipToolbar sizeToFit];
    self.commentsText.inputAccessoryView=self.tipToolbar;
}
-(void)ToolBarDoneClicked:(id)idd{
    
    [self.commentsText resignFirstResponder];
    
}

-(void)ToolBarCancelClicked:(id)idd{
    
    [self.commentsText resignFirstResponder];
    
}



//calling service for news view comments
- (void) callFileSaveWebService {
    objCallWS = [[WebService alloc]init];
    NSString *stringParams;
    self.commentsText.text= [self.commentsText.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    if (self.saveButton.tag == 2) {
        stringParams=[NSString stringWithFormat:@"method=setNewsReacties&deviceId=%@&treeid=%@&value=%@&userid=%@",UIAppDelegate.deviceIdString,self.newsIdString,self.commentsText.text,UIAppDelegate.userIdString];
    }
    else {
           stringParams=[NSString stringWithFormat:@"method=getNewsReacties&deviceId=%@&Newsid=%@",UIAppDelegate.deviceIdString,self.newsIdString];
        }
    self.commentsDetailsArray = [objCallWS callFileSaveWebService:stringParams];
    for(CommentsClass *comments in self.commentsDetailsArray)
    {
        //[self.valuesArray addObject:comments.valueString];
        [self.datePostsArray addObject:comments.datepostedString];
        [self.userImagesArray addObject:comments.userimageString];
    }
    rowCount = [self.commentsDetailsArray count];
    self.commentsText.text = @"";
    [self.commentsTableView reloadData];
}

//setting the frames of label and loading the table view
- (void) loadImageViewElements {
    
    UITapGestureRecognizer *itemImageTap= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backToBeforeView:)];
    itemImageTap.numberOfTapsRequired =1;
    itemImageTap.delegate = self;
    [logoImageView addGestureRecognizer:itemImageTap];
    newsTocusString = [newsTocusString stringByReplacingOccurrencesOfString:@"<p></p>" withString:@""];
    newsTocusString = [newsTocusString stringByReplacingOccurrencesOfString:@"<table style=\"width: 465px;" withString:@"<table style=\"width: 265px;"];
    if(newsTocusString.length>3)
    {
    newsTocusString=[@"<div id='foo' style='padding:3 3 3 3;'>" stringByAppendingString:newsTocusString];
        newsTocusString=[newsTocusString stringByAppendingString:@"</div>"];
        newsTocusString = [self resizeImage:newsTocusString];
    }
    
   // newsTocusString = [self stringByStrippingHTML:newsTocusString];
    webview.scrollView.bounces = NO; 
    [(UIScrollView*)[webview.subviews objectAtIndex:0] setShowsHorizontalScrollIndicator:NO];
    [(UIScrollView*)[webview.subviews objectAtIndex:0] setShowsVerticalScrollIndicator:YES];
    [(UIScrollView*)[webview.subviews objectAtIndex:0] setScrollEnabled:NO];
    if (load == false) {
        if ([self.newsTocusString length] == 23) {
        }
        else {
                [webview loadHTMLString:[NSString stringWithFormat:@"<html><body style=\"font-family:verdana;font-size:13\"> %@</body></html>", self.newsTocusString] baseURL:[NSURL URLWithString:@"http://"]];
           }
    }
    else {
           load = false;
         } 
    [self layerElements];
    [self loadHTML:newsTocusString];
    self.newsTitleLabel.text = self.newsTitleString;
    self.newsDatePublishedLabel.text = self.newsDateString;
    [self.newsAuthorButton.titleLabel setLineBreakMode:UILineBreakModeTailTruncation];
    [self.newsAuthorButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    self.newsAuthorButton.contentEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    [self.newsAuthorButton setTitle:self.newsAuthorString forState:UIControlStateNormal];
    [self.newsAuthorButton addTarget:self action:@selector(selectAuthorDetails:) forControlEvents:UIControlEventTouchUpInside];
    if ([self.newsImageString rangeOfString:@"http://"].location == NSNotFound) {
        self.newsSummaryImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.newsSummaryImageView.image = [UIImage imageNamed:@"newssumImg"];
        
    } else {
            NSString *imgstr=[self.newsImageString substringFromIndex:[self.newsImageString rangeOfString:@"http"].location ];
            UIImage *newsSummaryImage = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgstr]]];
            self.newsSummaryImageView.image = newsSummaryImage;
    }
}

//setting the bounds for view labels,textview and scrollview
- (void) layerElements {
    self.bgImgLabel.backgroundColor = [UIColor whiteColor];
    self.bgImgLabel.layer.masksToBounds = YES;
    self.bgImgLabel.layer.cornerRadius = 6.0;
    self.scrollView.layer.masksToBounds = YES;
    self.scrollView.layer.cornerRadius = 6.0;
    self.bgLabel.layer.masksToBounds = YES;
    self.bgLabel.layer.cornerRadius = 6.0;
    self.bgCommenteLabel.backgroundColor = [UIColor whiteColor];
    self.bgCommenteLabel.layer.masksToBounds = YES;
    self.bgCommenteLabel.layer.cornerRadius = 6.0;    
    self.commentsText.layer.cornerRadius=6.0f;
    self.commentsText.layer.masksToBounds=YES;
    self.commentsText.layer.borderColor=[[UIColor orangeColor]CGColor];
    self.commentsText.layer.borderWidth= 2.0f; 
    self.commentsText.backgroundColor = [UIColor clearColor];
}

- (NSString *) stringByStrippingHTML :(NSString *)str {
    NSRange r;
    NSString *s = [str copy];
    while ((r = [s rangeOfString:@"<img[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
    
    
}
-(NSString *) resizeImage : (NSString *) str{
    NSRange r;
    NSString *s = [str copy];
    while ((r = [s rangeOfString:@"width=\"[^\"]" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@"width=100% "];
    
    while ((r = [s rangeOfString:@"height=\"[^\"]" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString: [NSString stringWithFormat:@" "]];
    return s;
}
//Dynamically setting the table view cells according to response
- (void)loadHTML: (NSString *)html {
    
    int commentsHeight;
    int secheight;
    webViewHeight=[[webview stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"foo\").offsetHeight;"] intValue];
    commentsHeight=webViewHeight+20;
    CGRect frame = webview.frame;
    frame.size.height = webViewHeight;
    webview.frame=CGRectMake(webview.frame.origin.x, webview.frame.origin.y, webview.frame.size.width, commentsHeight-10);
    commentsHeight+=10;
   
    //Bg label height
    secheight = commentsHeight+newsSummaryImageView.frame.size.height+newsDatePublishedLabel.frame.size.height+newsAuthorButton.frame.size.height+43;
    frame = bgLabel.frame;
    frame.size.width = self.bgImgLabel.frame.size.width+2;
    bgLabel.frame = CGRectMake(bgLabel.frame.origin.x,bgLabel.frame.origin.y, frame.size.width+2,secheight+10);
    
    //Reacties
    secheight+=30;
    self.commentsTitleLabel.frame = CGRectMake(self.commentsTitleLabel.frame.origin.x, secheight, self.commentsTitleLabel.frame.size.width, self.commentsTitleLabel.frame.size.height);
    
    //tableview height
    commentsHeight=commentsTitleLabel.frame.origin.y+commentsTitleLabel.frame.size.height+10;
     
    if(rowCount==0){
        self.commentsTableView.hidden=YES;
    }
    else if(rowCount==1) {
        self.commentsTableView.hidden=NO;
        self.commentsTableView.frame = CGRectMake(self.commentsTableView.frame.origin.x, commentsHeight, self.commentsTableView.frame.size.width, self.commentsTableView.frame.size.height);
        commentsHeight = commentsTableView.frame.origin.y+commentsTableView.frame.size.height;
    }
    else if (rowCount > 1) {
        self.commentsTableView.hidden=NO;
        self.commentsTableView.frame = CGRectMake(self.commentsTableView.frame.origin.x, commentsHeight+10, self.commentsTableView.frame.size.width,rowCount*60);
        commentsHeight = commentsTableView.frame.origin.y+commentsTableView.frame.size.height+10;
    }
    
    // Bg text view height
    self.commentsText.frame = CGRectMake(self.commentsText.frame.origin.x, commentsHeight+10, self.commentsText.frame.size.width, self.commentsText.frame.size.height);
    
  // Save button height
    self.saveButton.frame = CGRectMake(self.saveButton.frame.origin.x,self.commentsText.frame.size.height+self.commentsText.frame.origin.y+10, self.saveButton.frame.size.width, self.saveButton.frame.size.height);
    commentsHeight = self.bgLabel.frame.size.height+10;
   
    // Bg comment label
    self.bgCommenteLabel.frame = CGRectMake(self.bgCommenteLabel.frame.origin.x-10, commentsHeight,self.bgCommenteLabel.frame.size.width+10,self.saveButton.frame.origin.y-commentsHeight+30);
    
    // Scroll view height
    frame = webview.frame;
    frame.size.height = commentsHeight+bgLabel.frame.size.height+30;
    commentsHeight=bgLabel.frame.size.height+bgCommenteLabel.frame.size.height+10;
    [self.scrollView setContentSize:(CGSizeMake(280,commentsHeight+30))];
}

//Selecting the author details
- (IBAction)selectAuthorDetails:(id)sender {
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
    NSString *stringParams=[NSString stringWithFormat:@"method=getUserDetail&deviceId=%@&userId=%@",UIAppDelegate.deviceIdString,self.newsUserId];
    objCallWS = [[WebService alloc]init];
    ContactViewDetails *responseContactDetails = [objCallWS callContactDetailsWebService:stringParams];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        ContactenViewDetails *objDetails = [[ContactenViewDetails alloc]initWithNibName:@"ContactenViewDetails~ipad" bundle:nil];
        objDetails.objContactDetails = responseContactDetails;
        objDetails.newsString = @"1";
        [self presentModalViewController:objDetails animated:NO];
    }
    else{
      ContactenViewDetails *objDetails = [[ContactenViewDetails alloc]initWithNibName:@"ContactenViewDetails" bundle:nil];
        objDetails.objContactDetails = responseContactDetails;
        objDetails.newsString = @"1";
        [self presentModalViewController:objDetails animated:NO];
    }
    
    
    
}

#pragma mark -
#pragma mark Table View Methods 

-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return [commentsDetailsArray count];
}

//Loading the table view cells with Comments data Response
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier= @"cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if(cell == nil)
	{
      cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
	}
    CommentsClass *objClass =[self.commentsDetailsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = objClass.datepostedString;
    cell.textLabel.font = [UIFont fontWithName:@"Courier" size:14];
    cell.detailTextLabel.text = [UIAppDelegate.valueArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.numberOfLines = 2;
    cell.imageView.image = [UIImage imageNamed:@"newssumImg.png"];
    cell.imageView.frame = CGRectMake(cell.imageView.frame.origin.x, cell.imageView.frame.origin.y,cell.imageView.frame.size.width-5, cell.imageView.frame.size.height-3);
    NSString *str = [NSString stringWithFormat:@"%@/%@&intra_id=%@",UIAppDelegate.urlString,objClass.userimageString,UIAppDelegate.intraidString];
    if (( ![objClass.userimageString isEqual:[NSNull null]] ) && ( [objClass.userimageString length] != 0 ) && ([objClass.userimageString rangeOfString:@"http"].location != NSNotFound )) {
        NSString *imgstr=[str substringFromIndex:[str rangeOfString:@"http"].location ];
        UIImage *newsSummaryImage = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgstr]]];
        //cell.imageView.image = [UIImage imageNamed:@"newssumImg.png"];
        cell.imageView.image = newsSummaryImage;
        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
    } else {
         cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
         cell.imageView.image = [UIImage imageNamed:@"newssumImg.png"];
    }
     	return cell;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
   // [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width,vheight)];
    [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentSize.height-self.scrollView.frame.size.height)];
    //self.view.frame = CGRectMake(0,0,320,480);
    //[self.scrollView setContentOffset:CGPointZero];
    
    return YES;
}

//Creating an Action Event for Entering Comments
- (IBAction)enterComments:(id)sender
{
    [commentsText resignFirstResponder];
    self.saveButton.tag = 2;
    objCallWS = [[WebService alloc]init]; 
    if ([self.commentsText.text length] == 0) {
        self.alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Comments field is empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [self.alert show];
    }
    if ([self.commentsText.text length] > 0) {    
        [self callFileSaveWebService];
        load = true;
        [self loadImageViewElements];
    }
}

//Dismissing the present View Controller When tapped on Logo Image
- (void)backToBeforeView:(UITapGestureRecognizer*)sender
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView~ipad" bundle:nil];
        [self presentModalViewController:objMainView animated:YES];
    }
    else{
        MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView" bundle:nil];
        [self presentModalViewController:objMainView animated:YES];
    }
   
}

- (void) indicatorView {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    if (textView == self.commentsText) {
        
        //Changed by Aadil Keshwani
        //[self.scrollView setContentOffset:CGPointMake(0,webview.frame.size.height+webview.frame.origin.y) animated:YES];
        [self.scrollView setContentOffset:CGPointMake(0,self.commentsText.frame.origin.y-30) animated:YES];
       

//		self.view.frame = CGRectMake(0,-217,320,480);
	}
	return YES;
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
//    NSDictionary* info = [aNotification userInfo];
//    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+ kbSize.height);
//    
//    [self.scrollView setContentOffset:CGPointMake(0, kbSize.height) animated:YES];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
//        self.view.frame = CGRectMake(0,0,320,480);
        return NO;
    }
    return YES;
}

//Creating Web View Load request
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if(loadFlag>0){
        LoadWebView *lView=[[LoadWebView alloc]initWithNibName:@"LoadWebView" bundle:nil];
        lView.req=request;
        //[self presentModalViewController:lView animated:YES];
        //loadFlag=1;
        //[webView stopLoading];
    }
    return YES;
}
//Starting the WebView Load
- (void)webViewDidStartLoad:(UIWebView *)webView{
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if(loadFlag>0){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        //[webView stopLoading];
    }
    else{
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
}
static NSString *bridgeScheme = @"myCoolScheme";

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    if(loadFlag>0){
        //[webView stopLoading];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
    loadFlag++;
    [self loadHTML:newsTocusString ];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    //vheight=self.bgCommenteLabel.frame.origin.y+self.bgCommenteLabel.frame.size.height;
    //
    vheight=self.commentsTableView.frame.origin.y+self.bgCommenteLabel.frame.size.height;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    if(loadFlag > 0) {
        //[webView stopLoading];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

//Setting the logo image and scroll View frames
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    UIAppDelegate->cmsImageURL = [defaults valueForKey:@"logo"];    
    if(UIAppDelegate.cmsImageData==nil) {
    }    
    else {
           [[UIApplication sharedApplication] setStatusBarHidden:YES];
           logoImageView.image=[UIImage imageWithData: UIAppDelegate.cmsImageData];
    }
}

//Dismiss the Present View when Clicked on Back
- (IBAction)backClicked:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

//navigating to Main View when Clicked on Home Button
- (IBAction)homeClicked:(id)sender {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView~ipad" bundle:nil];
        [self presentModalViewController:objMainView animated:YES];
    }
    else{
        MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView" bundle:nil];
        [self presentModalViewController:objMainView animated:YES];
    }
    
}

-(void)viewWillDisappear:(BOOL)animated{
    loadFlag=0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
