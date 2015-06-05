//
//  WikiviewDetails.m
//  PortalCMS
//
//  Created by Etisbew on 05/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WikiviewDetails.h"
#import "MyTreeViewCell.h"


@interface WikiviewDetails ()
{
    BOOL injectedPageLoadedJS;
}
@property(nonatomic, retain) NSTimer *loadStatusCheckTimer;

@end

@implementation WikiviewDetails
@synthesize webview;
@synthesize logoImageView;
@synthesize bgImgLabel;
@synthesize descString;
@synthesize titleString;
@synthesize selectTitleLabel;
@synthesize scrollView;
@synthesize commentsTableView;
@synthesize commentsText;
@synthesize commentsTitleLabel;
@synthesize commentsDetailsArray;
@synthesize alert,treeId;
@synthesize saveButton;
@synthesize bgLabel;
@synthesize bgCommenteLabel;
@synthesize htmlString;
@synthesize strDesc;
@synthesize strWikiSearch;

int webViewHeight;

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
    navBar.frame=CGRectMake(0,0,320,30);
    self.commentsDetailsArray = [[NSMutableArray alloc]init];
    [self.scrollView setContentOffset:CGPointMake(0, 0)];
    //loading the user defaults from login view
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    UIAppDelegate.deviceIdString=[defaults valueForKey:@"deviceId"];
    UIAppDelegate.intraidString=[defaults valueForKey:@"intraid"];
    UIAppDelegate.categoryIdString=[defaults valueForKey:@"categorieId"];
    UIAppDelegate.userIdString=[defaults valueForKey:@"userid"];
    UIAppDelegate.CMSUrlString = [defaults valueForKey:@"mobileurl"];
    UIAppDelegate.urlString = [defaults valueForKey:@"imageurl"];
    self.commentsTableView.scrollEnabled = NO;
    [self callFileSaveWebService];
    [self loadImageViewElements];
    webview.delegate=self;
    loadFlag=0;
    self.selectTitleLabel.text = self.titleString;
    injectedPageLoadedJS = NO;
    self.loadStatusCheckTimer = nil;
}
-(void) checkLoadStatus
{
    NSString *evalString = [self.webview stringByEvaluatingJavaScriptFromString:@"window.__myLoad5t4tu5__;"];
    if([evalString isEqualToString:@"loaded"])
    {
        //Web page has finished. Shut down the timer.
        [self.loadStatusCheckTimer invalidate];
        self.loadStatusCheckTimer = nil;
    }
}

//calling the getWikiDescription service 
- (void) getWikiDescription {
    objCallWS = [[WebService alloc]init];
    NSString *stringParams =[NSString stringWithFormat:@"method=getWikiDescription&deviceId=%@&treeid=%@",UIAppDelegate.deviceIdString,self.treeId];
    [objCallWS callWikiDescriptionService:stringParams];
    strDesc = UIAppDelegate.wikiDescString;
}

- (void) callFileSaveWebService {
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
    objCallWS = [[WebService alloc]init];
    NSString *stringParams;
    self.commentsText.text= [self.commentsText.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    if (self.saveButton.tag == 2) {
        
        //calling the setNewsReacties service and setting the comments response
        stringParams=[NSString stringWithFormat:@"method=setNewsReacties&deviceId=%@&treeid=%@&value=%@&userid=%@",UIAppDelegate.deviceIdString,self.treeId,self.commentsText.text,UIAppDelegate.userIdString];
   
    }  else {
        
        //calling the setNewsReacties service and getting the comments response
          stringParams=[NSString stringWithFormat:@"method=getNewsReacties&deviceId=%@&Newsid=%@",UIAppDelegate.deviceIdString,self.treeId];
    }
    self.commentsDetailsArray = [objCallWS callFileSaveWebService:stringParams];
    rowCount = [self.commentsDetailsArray count];
    self.commentsText.text = @"";
    [self.commentsTableView reloadData];
}

//adjusting the frames
- (void) loadImageViewElements {
    load = false;
    if(strWikiSearch != nil && [strWikiSearch length] > 0)
    {
        [self getWikiDescription];
        if (strDesc != nil) {
             strDesc=[@"<div id='foo' style='padding:5 5 5 5;'>" stringByAppendingString:strDesc];
        }
    }
    else
    {
    if (strDesc != nil) {
        strDesc=[@"<div id='foo' style='padding:5 5 5 5;'>" stringByAppendingString:strDesc];
     }
    }
    strDesc =[strDesc stringByAppendingString:@"</div>"];
    strDesc = [self resizeImage:strDesc];
     webview.scrollView.bounces = NO; 
    [(UIScrollView*)[webview.subviews objectAtIndex:0] setShowsHorizontalScrollIndicator:NO];
    [(UIScrollView*)[webview.subviews objectAtIndex:0] setShowsVerticalScrollIndicator:NO];
    [(UIScrollView*)[webview.subviews objectAtIndex:0] setScrollEnabled:NO];
    [self layerElements];
    if (load == false) {
        [webview loadHTMLString:[NSString stringWithFormat:@"<html><body style=\"font-family:verdana;font-size:13\"> %@</body></html>", self.strDesc] baseURL:nil];
    }
    else {
            load = false;
         }
    [self.scrollView setContentSize:(CGSizeMake(296,self.webview.frame.size.height +30))];
    UITapGestureRecognizer *itemImageTap= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backToBeforeView:)];
      itemImageTap.numberOfTapsRequired =1;
    itemImageTap.delegate = self;
    [logoImageView addGestureRecognizer:itemImageTap];
    [self loadHTML:strDesc];
}

//Adjusting the label and text frames
- (void) layerElements {
    self.bgImgLabel.backgroundColor = [UIColor whiteColor];
    self.bgImgLabel.layer.masksToBounds = YES;
    self.bgImgLabel.layer.cornerRadius = 6.0;
    self.scrollView.layer.masksToBounds = YES;
    self.scrollView.layer.cornerRadius = 6.0;
    self.bgLabel.backgroundColor = [UIColor whiteColor];
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

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *str = [NSString stringWithFormat:@"%@",request];
    if ([str rangeOfString:@"http://"].location == NSNotFound) {
    }
    else {
      if(loadFlag>0){
          
          if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
              LoadWebView *lView=[[LoadWebView alloc]initWithNibName:@"LoadWebView~ipad" bundle:nil];
              lView.req=request;
              [self presentModalViewController:lView animated:YES];
              loadFlag=1;
              [webView stopLoading];

          }
          else{
              LoadWebView *lView=[[LoadWebView alloc]initWithNibName:@"LoadWebView" bundle:nil];
              lView.req=request;
              [self presentModalViewController:lView animated:YES];
              loadFlag=1;
              [webView stopLoading];

          }
      }
    }
    return YES;
}

//load the webViewDidStartLoad
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if(loadFlag>0){
        [webView stopLoading];
    }
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    if(loadFlag>0){
        [webView stopLoading];
    }
    
    loadFlag++;
    [self loadHTML:strDesc];
    if(!injectedPageLoadedJS)
    {
        [self.webview stringByEvaluatingJavaScriptFromString:@"window.__myLoad5t4tu5__ = 'notloaded'; window.onload=function() {window.__myLoad5t4tu5__ = 'loaded';}"];
        injectedPageLoadedJS = YES;
        
        self.loadStatusCheckTimer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                                     target:self
                                                                   selector:@selector(checkLoadStatus)
                                                                   userInfo:nil
                                                                    repeats:YES];
    }
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}

//Dynamically setting the frames according the content
- (void)loadHTML: (NSString *)html {
    
    int commentsHeight;
    webViewHeight=[[webview stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"foo\").offsetHeight;"] intValue];
    commentsHeight=webViewHeight+20;
    CGRect frame = webview.frame;
    frame.size.height = webViewHeight;
    webview.frame=CGRectMake(webview.frame.origin.x, webview.frame.origin.y, webview.frame.size.width, commentsHeight-10);
    commentsHeight+=45;
    
    // Bg label height
    frame = bgLabel.frame;
    frame.size.width = self.bgImgLabel.frame.size.width+2;
    bgLabel.frame = CGRectMake(bgLabel.frame.origin.x,bgLabel.frame.origin.y, frame.size.width+2,commentsHeight+10);

    // Reacties
    commentsHeight+=30;
    self.commentsTitleLabel.frame = CGRectMake(self.commentsTitleLabel.frame.origin.x, commentsHeight, self.commentsTitleLabel.frame.size.width, self.commentsTitleLabel.frame.size.height);

    // tableview height

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
    [self.scrollView setContentSize:(CGSizeMake(280,commentsHeight))];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    if(loadFlag>0){
        [webView stopLoading];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    loadFlag=0;
}

- (NSString *) stringByStrippingHTML :(NSString *)str {
    NSRange r;
    NSString *s;
    s = [str copy];
    while ((r = [s rangeOfString:@"<img[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s; 
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
    //self.view.frame = CGRectMake(0,0,320,480);
    //Added by Aadil Keshwani 
    [self.scrollView setContentOffset:CGPointMake(0, 0)];
    return YES;
}

//calling the enterComments action method
- (IBAction)enterComments:(id)sender
{
    [commentsText resignFirstResponder];
    self.saveButton.tag = 2;
    objCallWS = [[WebService alloc]init];    
    NSString *aString = self.commentsText.text;
    aString=[self.commentsText.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([self.commentsText.text length] == 0 ||[aString length]==0 ) {
        self.alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Comments field is empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [self.alert show];
    }
    else {    
           [self callFileSaveWebService];
           [self loadImageViewElements];
    }
}

#pragma mark -
#pragma mark Table View Methods 

-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return [commentsDetailsArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
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
    cell.detailTextLabel.text = objClass.valueString;
//    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
//    cell.textLabel.numberOfLines = 2;
    cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.detailTextLabel.numberOfLines = 2;
    cell.imageView.frame = CGRectMake(cell.imageView.frame.origin.x, cell.imageView.frame.origin.y,cell.imageView.frame.size.width-5, cell.imageView.frame.size.height-3);
    NSString *str = [NSString stringWithFormat:@"%@/%@&intra_id=%@",UIAppDelegate.urlString,objClass.userimageString,UIAppDelegate.intraidString];
    if (UIAppDelegate.urlString != nil) {
        if ([objClass.userimageString rangeOfString:@".jpg"].location == NSNotFound) {
            cell.imageView.image = [UIImage imageNamed:@"newssummaryImg"];
            
        } else {
            
            UIImage *newsSummaryImage = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[str substringFromIndex:[str rangeOfString:@"http"].location ]]]];
            
            cell.imageView.image = newsSummaryImage;
        }
    }
    else {
           //cell.imageView.image = [UIImage imageNamed:@"newssummaryImg"];
    }
    
    return cell;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

//dismiss to present view on touching logo image
- (void)backToBeforeView:(UITapGestureRecognizer*)sender
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView~ipad" bundle:nil];
        [self presentModalViewController:objMainView animated:NO];
    }
    else{
        MainView *objMainView = [[MainView alloc]initWithNibName:@"MainView" bundle:nil];
        [self presentModalViewController:objMainView animated:NO];
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
        //Added by Aadil Keshwani to Scroll
        [self.scrollView setContentOffset:CGPointMake(0, textView.frame.origin.y-40)];
		//self.view.frame = CGRectMake(0,-217,320,480);
	}
	return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        [self.scrollView setContentOffset:CGPointMake(0, 0)];
       // self.view.frame = CGRectMake(0,0,320,480);
        return NO;
    }
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   
    /** CMS Image Code **/
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    UIAppDelegate->cmsImageURL = [defaults valueForKey:@"logo"];    
    if(UIAppDelegate.cmsImageData==nil) {
    }    
    else {
     //     logoImageView.frame=CGRectMake(110, 35, 97, 47);
      //    scrollView.frame=CGRectMake(8,88,308,386);
          logoImageView.image=[UIImage imageWithData: UIAppDelegate.cmsImageData];
      }
}


//dismiss to present view on touching back button
-(IBAction)backClicked:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

//presenting  Main view on touching Home button
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

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
