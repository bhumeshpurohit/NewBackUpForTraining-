//
//  NieuwsView.m
//  PortalCMS
//
//  Created by Etisbew on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NieuwsView.h"

@interface NieuwsView ()

@end

@implementation NieuwsView
@synthesize logoImageView;
@synthesize titleLabel;
@synthesize nieuwsDetailsTableView;
@synthesize nieuwsDetailsArray;
@synthesize selectButtonTag;
@synthesize limitCount;
@synthesize alert,buttonTitleString;
@synthesize loaderView;
@synthesize objClass;
@synthesize loadingLabel;
@synthesize bgImgLabel;
@synthesize imageDownloadsInProgress;
@synthesize objContactDetails;

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
    UIAppDelegate.imagevalue=0;
    
    //loading the user defaults from login view 
    defaults = [NSUserDefaults standardUserDefaults];
    UIAppDelegate.deviceIdString=[defaults valueForKey:@"deviceId"];
    UIAppDelegate.intraidString=[defaults valueForKey:@"intraid"];
    UIAppDelegate.categoryIdString=[defaults valueForKey:@"categorieId"];
    UIAppDelegate.CMSUrlString = [defaults valueForKey:@"mobileurl"];
    UIAppDelegate->cmsImageURL = [defaults valueForKey:@"logo"];
    self.imageDownloadsInProgress = [NSMutableDictionary dictionary];
    limitCount = 0;
    flag = false;
    objCallWS = [[WebService alloc]init];
    [self loadImageViewElements];
}
- (IBAction)logout:(id)sender
{
    [defaults setValue:@"" forKey:@"username"];
    [defaults setValue:@"" forKey:@"password"];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        LoginView *login = [[LoginView alloc] initWithNibName:@"LoginView~ipad" bundle:nil];
        [self presentModalViewController:login animated:NO];
    }
    else{
        LoginView *login = [[LoginView alloc] initWithNibName:@"LoginView" bundle:nil];
        [self presentModalViewController:login animated:NO];
    }
    
    //[self.navigationController  pushViewController:login animated:NO];
}
//setting the frames of label and loading the table view
- (void) loadImageViewElements {
    bgImgLabel.backgroundColor = [UIColor whiteColor];
    bgImgLabel.layer.masksToBounds = YES;
    bgImgLabel.layer.cornerRadius = 6.0;
    titleLabel.layer.masksToBounds = YES;
    titleLabel.layer.cornerRadius = 6.0;
    self.nieuwsDetailsTableView.separatorColor = [UIColor darkGrayColor];
    self.nieuwsDetailsTableView.layer.cornerRadius = 8.0;
    nieuwsDetailsArray = [[NSMutableArray alloc]init];
   
    // add touch gesture for logo image
    UITapGestureRecognizer *itemImageTap= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backToBeforeView:)];
    itemImageTap.numberOfTapsRequired =1;
    itemImageTap.delegate = self;
    [self.logoImageView addGestureRecognizer:itemImageTap];
    
    //if nieuws and blogs response count is "0" hide the table view
    if ([UIAppDelegate.countString isEqualToString:@"0"]) {
        flag = true;
        self.nieuwsDetailsTableView.hidden = YES;
        recordsLabel.hidden = NO;
        outlineLabel.hidden = NO;
    }
    else {
           outlineLabel.hidden = YES;
         }
}

//dismiss to present view on touching logo image 
- (void)backToBeforeView:(UITapGestureRecognizer*)sender
{
    UIAppDelegate.imagevalue=1;
    [self dismissModalViewControllerAnimated:YES];
}
-(IBAction)back:(id)sender
{
    UIAppDelegate.imagevalue=1;
    [self dismissModalViewControllerAnimated:YES];
}
#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([buttonTitleString isEqualToString:@"Blogs"]) {
        return [UIAppDelegate.blogssummaryArray count];
    }
    else {
           return [UIAppDelegate.newssummaryArray count];
       }
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"NieuwsCustomCell";
    cell = (NieuwsCustomCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"NieuwsCustomCell" owner:self options:nil];
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]) {
				cell =  (NieuwsCustomCell *) currentObject;
				break;
			}
		}
	}
    NSString *details;
    if ([buttonTitleString isEqualToString:@"Blogs"])
    {
      details = [UIAppDelegate.blogssummaryArray objectAtIndex:indexPath.row];
    }
    else
    {
      details = [UIAppDelegate.newssummaryArray objectAtIndex:indexPath.row];
    }
	CGRect detailRect = cell.newsSummaryLabel.frame;
	CGSize textSize = { detailRect.size.width, 20000.0f };
	CGSize calculatedDetailRectSize = [details sizeWithFont:[UIFont fontWithName:@"Helvetica" size:15] constrainedToSize:textSize lineBreakMode:UILineBreakModeWordWrap];
	cell.newsSummaryLabel.frame = CGRectMake(detailRect.origin.x, detailRect.origin.y, detailRect.size.width, calculatedDetailRectSize.height);
	cell.newsSummaryLabel.numberOfLines = 0;
    cell.newsAuthorButton.frame = CGRectMake(cell.newsAuthorButton.frame.origin.x, cell.newsSummaryLabel.frame.size.height + 65, cell.newsAuthorButton.frame.size.width, cell.newsAuthorButton.frame.size.height);
    cell.doorLabel.frame = CGRectMake(cell.doorLabel.frame.origin.x, cell.newsSummaryLabel.frame.size.height + 65, cell.newsAuthorButton.frame.size.width, cell.newsAuthorButton.frame.size.height);
    cell.newsDatePublishedLabel.frame = CGRectMake(cell.newsDatePublishedLabel.frame.origin.x, cell.newsSummaryLabel.frame.size.height + 85, cell.newsDatePublishedLabel.frame.size.width, cell.newsDatePublishedLabel.frame.size.height);
    cell.opLabel.frame = CGRectMake(cell.opLabel.frame.origin.x, cell.newsSummaryLabel.frame.size.height + 85, cell.opLabel.frame.size.width, cell.opLabel.frame.size.height);
    [cell.newsAuthorButton.titleLabel setLineBreakMode:UILineBreakModeTailTruncation];
    [cell.newsAuthorButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    cell.newsAuthorButton.contentEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    cell.newsAuthorButton.tag = indexPath.row;
    [cell.newsAuthorButton addTarget:self action:@selector(selectAuthorDetails:) forControlEvents:UIControlEventTouchUpInside];
    NSString *strimage;
    if ([buttonTitleString isEqualToString:@"Blogs"]) {
        [cell.newsAuthorButton setTitle:[UIAppDelegate.blogsAuthorArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        cell.newsTitleLabel.text = [UIAppDelegate.blogsTitleArray objectAtIndex:indexPath.row];
        
        NSString *blogsummary = [UIAppDelegate.blogssummaryArray objectAtIndex:indexPath.row] ;
        //blogsummary = [self kv_decodeHTMLCharacterEntities :blogsummary];
        
        cell.newsSummaryLabel.text = blogsummary;
        
       // cell.newsSummaryLabel.text = [UIAppDelegate.blogssummaryArray objectAtIndex:indexPath.row];
        cell.newsDatePublishedLabel.text = [UIAppDelegate.blogsDateArray objectAtIndex:indexPath.row];
        strimage = [UIAppDelegate.blogsImageArray objectAtIndex:indexPath.row];
    }
    else {
          [cell.newsAuthorButton setTitle:[UIAppDelegate.newsAuthorArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
         cell.newsTitleLabel.text = [UIAppDelegate.newstitleArray objectAtIndex:indexPath.row];
     
        NSString *strsummary = [UIAppDelegate.newssummaryArray objectAtIndex:indexPath.row] ;
        //strsummary = [self kv_decodeHTMLCharacterEntities :strsummary];
        
        cell.newsSummaryLabel.text = strsummary;
         cell.newsDatePublishedLabel.text = [UIAppDelegate.newsDateArray objectAtIndex:indexPath.row];
        strimage = [UIAppDelegate.newsImageArray objectAtIndex:indexPath.row];
    }
    if([strimage length] > 1) {
        if(UIAppDelegate.isNetworkIsAvailable)
        {
            if (self.nieuwsDetailsTableView.dragging == NO && self.nieuwsDetailsTableView.decelerating == NO)
            {
                if ([buttonTitleString isEqualToString:@"Blogs"]) {
                    [self startIconDownload:UIAppDelegate.blogsImageArray forIndexPath:indexPath];
                }
                else {
                    [self startIconDownload:UIAppDelegate.newsImageArray forIndexPath:indexPath];
                }
            }
        }
    }
  return cell;
}


//replacing the special characters
- (NSString *)kv_decodeHTMLCharacterEntities :(NSString*)str {
    
    if ([str rangeOfString:@"&"].location == NSNotFound) {
        return str;
    } else {
        NSMutableString *escaped = [NSMutableString stringWithString:str];
        NSArray *codes = [NSArray arrayWithObjects:
                          @"&nbsp;", @"&iexcl;", @"&cent;", @"&pound;", @"&curren;", @"&yen;", @"&brvbar;",
                          @"&sect;", @"&uml;", @"&copy;", @"&ordf;", @"&laquo;", @"&not;", @"&shy;", @"&reg;",
                          @"&macr;", @"&deg;", @"&plusmn;", @"&sup2;", @"&sup3;", @"&acute;", @"&micro;",
                          @"&para;", @"&middot;", @"&cedil;", @"&sup1;", @"&ordm;", @"&raquo;", @"&frac14;",
                          @"&frac12;", @"&frac34;", @"&iquest;", @"&Agrave;", @"&Aacute;", @"&Acirc;",
                          @"&Atilde;", @"&Auml;", @"&Aring;", @"&AElig;", @"&Ccedil;", @"&Egrave;",
                          @"&Eacute;", @"&Ecirc;", @"&Euml;", @"&Igrave;", @"&Iacute;", @"&Icirc;", @"&Iuml;",
                          @"&ETH;", @"&Ntilde;", @"&Ograve;", @"&Oacute;", @"&Ocirc;", @"&Otilde;", @"&Ouml;",
                          @"&times;", @"&Oslash;", @"&Ugrave;", @"&Uacute;", @"&Ucirc;", @"&Uuml;", @"&Yacute;",
                          @"&THORN;", @"&szlig;", @"&agrave;", @"&aacute;", @"&acirc;", @"&atilde;", @"&auml;",
                          @"&aring;", @"&aelig;", @"&ccedil;", @"&egrave;", @"&eacute;", @"&ecirc;", @"&euml;",
                          @"&igrave;", @"&iacute;", @"&icirc;", @"&iuml;", @"&eth;", @"&ntilde;", @"&ograve;",
                          @"&oacute;", @"&ocirc;", @"&otilde;", @"&ouml;", @"&divide;", @"&oslash;", @"&ugrave;",
                          @"&uacute;", @"&ucirc;", @"&uuml;", @"&yacute;", @"&thorn;", @"&yuml;",nil];
        
        NSUInteger i, count = [codes count];
        
        // Html
        for (i = 0; i < count; i++) {
            NSRange range = [str rangeOfString:[codes objectAtIndex:i]];
            if (range.location != NSNotFound) {
                [escaped replaceOccurrencesOfString:[codes objectAtIndex:i]
                                         withString:[NSString stringWithFormat:@"%C", 160 + i]
                                            options:NSLiteralSearch
                                              range:NSMakeRange(0, [escaped length])];
            }
        }
        
        // The following five are not in the 160+ range
        
        // @"&amp;"
        NSRange range = [str rangeOfString:@"&amp;"];
        if (range.location != NSNotFound) {
            [escaped replaceOccurrencesOfString:@"&amp;"
                                     withString:[NSString stringWithFormat:@"%C", 38]
                                        options:NSLiteralSearch
                                          range:NSMakeRange(0, [escaped length])];
        }
        
        // @"&lt;"
        range = [str rangeOfString:@"&lt;"];
        if (range.location != NSNotFound) {
            [escaped replaceOccurrencesOfString:@"&lt;"
                                     withString:[NSString stringWithFormat:@"%C", 60]
                                        options:NSLiteralSearch
                                          range:NSMakeRange(0, [escaped length])];
        }
        
        // @"&gt;"
        range = [str rangeOfString:@"&gt;"];
        if (range.location != NSNotFound) {
            [escaped replaceOccurrencesOfString:@"&gt;"
                                     withString:[NSString stringWithFormat:@"%C", 62]
                                        options:NSLiteralSearch
                                          range:NSMakeRange(0, [escaped length])];
        }
        
        // @"&apos;"
        range = [str rangeOfString:@"&apos;"];
        if (range.location != NSNotFound) {
            [escaped replaceOccurrencesOfString:@"&apos;"
                                     withString:[NSString stringWithFormat:@"%C", 39]
                                        options:NSLiteralSearch
                                          range:NSMakeRange(0, [escaped length])];
        }
        
        // @"&quot;"
        range = [str rangeOfString:@"&quot;"];
        if (range.location != NSNotFound) {
            [escaped replaceOccurrencesOfString:@"&quot;"
                                     withString:[NSString stringWithFormat:@"%C", 34]
                                        options:NSLiteralSearch
                                          range:NSMakeRange(0, [escaped length])];            
        }
        
        // Decimal & Hex
        NSRange start, finish, searchRange = NSMakeRange(0, [escaped length]);
        i = 0;
        
        while (i < [escaped length]) {
            start = [escaped rangeOfString:@"&#"
                                   options:NSCaseInsensitiveSearch
                                     range:searchRange];
            
            finish = [escaped rangeOfString:@";"
                                    options:NSCaseInsensitiveSearch
                                      range:searchRange];
            
            if (start.location != NSNotFound && finish.location != NSNotFound &&
                finish.location > start.location) {
                NSRange entityRange = NSMakeRange(start.location, (finish.location - start.location) + 1);
                NSString *entity = [escaped substringWithRange:entityRange];
                NSString *value = [entity substringWithRange:NSMakeRange(2, [entity length] - 2)];
                
                [escaped deleteCharactersInRange:entityRange];
                
                if ([value hasPrefix:@"x"]) {
                    unsigned tempInt = 0;
                    NSScanner *scanner = [NSScanner scannerWithString:[value substringFromIndex:1]];
                    [scanner scanHexInt:&tempInt];
                    [escaped insertString:[NSString stringWithFormat:@"%C", tempInt] atIndex:entityRange.location];
                } else {
                    [escaped insertString:[NSString stringWithFormat:@"%C", [value intValue]] atIndex:entityRange.location];
                }
                
                i = start.location;
            }
            else {
                     i++;
                 }
            searchRange = NSMakeRange(i, [escaped length] - i);
        }
        return escaped; // Note this is autoreleased
    }
}

#pragma mark -
#pragma mark Table cell image support
- (void)startIconDownload:(NSMutableArray *)appRecord forIndexPath:(NSIndexPath *)indexPath
{
    IconDownloader *iconDownloader = [imageDownloadsInProgress objectForKey:indexPath];
    if (iconDownloader == nil)
    {
        iconDownloader = [[IconDownloader alloc] init];
        iconDownloader.indexPathInTableView = indexPath;
        iconDownloader.delegate = self;
        [imageDownloadsInProgress setObject:iconDownloader forKey:indexPath];
        NSString *strimage;
        if ([buttonTitleString isEqualToString:@"Blogs"]) {
            strimage = [UIAppDelegate.blogsImageArray objectAtIndex:indexPath.row];
        }
        else {
               strimage = [UIAppDelegate.newsImageArray objectAtIndex:indexPath.row];
        }
        [iconDownloader startDownload :strimage];
    }
}

//download images
- (void)loadImagesForOnscreenRows
{
    if ([UIAppDelegate.newsImageArray count] > 0)
    {
        NSArray *visiblePaths = [self.nieuwsDetailsTableView indexPathsForVisibleRows];
        for (NSIndexPath *indexPath in visiblePaths)
        {
            if ([buttonTitleString isEqualToString:@"Blogs"]) {
                [self startIconDownload:[UIAppDelegate.blogsImageArray objectAtIndex:indexPath.row] forIndexPath:indexPath];
            }
            else {
                [self startIconDownload:[UIAppDelegate.newsImageArray objectAtIndex:indexPath.row] forIndexPath:indexPath];
            }
        }
    }
}

//setting the custom cell image
- (void)appImageDidLoad:(NSIndexPath *)indexPath :(UIImage*)image
{
    if(indexPath!=nil)
    {
       IconDownloader *iconDownloader = [imageDownloadsInProgress objectForKey:indexPath];
       if (iconDownloader != nil)
        {
          cell =(NieuwsCustomCell*) [self.nieuwsDetailsTableView cellForRowAtIndexPath:iconDownloader.indexPathInTableView];
          cell.newsSummaryImageView.image = image;
        }
    }

    // Remove the IconDownloader from the in progress list.
    [imageDownloadsInProgress removeObjectForKey:indexPath];
}

//getting userdetails
- (IBAction)selectAuthorDetails:(id)sender
{
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
    UIButton *selectedButton = (UIButton *)sender;
    NSString *newsUserId;
    if ([buttonTitleString isEqualToString:@"Blogs"]) {
        newsUserId = [UIAppDelegate.blogsUserIdArray objectAtIndex:selectedButton.tag];
    }
    else {
           newsUserId = [UIAppDelegate.newsuserIdArray objectAtIndex:selectedButton.tag];
    }
    NSString *stringParams=[NSString stringWithFormat:@"method=getUserDetail&deviceId=%@&userId=%@",UIAppDelegate.deviceIdString,newsUserId];
    ContactViewDetails *responseContactDetails = [objCallWS callContactDetailsWebService:stringParams];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        ContactenViewDetails *objContactViewDetails = [[ContactenViewDetails alloc]initWithNibName:@"ContactenViewDetails~ipad" bundle:nil];
        objContactViewDetails.objContactDetails = responseContactDetails;
        objContactViewDetails.newsString = @"1";
        [self presentModalViewController:objContactViewDetails animated:NO];
    }
    else{
        ContactenViewDetails *objContactViewDetails = [[ContactenViewDetails alloc]initWithNibName:@"ContactenViewDetails" bundle:nil];
        objContactViewDetails.objContactDetails = responseContactDetails;
        objContactViewDetails.newsString = @"1";
        
        //code edited by Bhumesh Purohit
        if ([objContactDetails.usersMobileString isEqualToString:@""]) {
            objContactViewDetails.userMobileLabel.hidden = YES;
            objContactViewDetails.mobileButton.hidden = YES;
            objContactViewDetails.telePhoneButton.frame = CGRectMake(28, 223, 262, 40);
            objContactViewDetails.userTelePhoneLabel.frame = CGRectMake(86,232,192,21);
        }
        else {
            objContactViewDetails.userMobileLabel.hidden = NO;
            objContactViewDetails.mobileButton.hidden = NO;
            objContactViewDetails.userMobileLabel.text = objContactViewDetails.objContactDetails.usersMobileString;
        }

        
        
         [self presentModalViewController:objContactViewDetails animated:NO];
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	CGSize textSize = { 229, 20000.0f };		// width and height of text area
    NSString *details;
    if ([buttonTitleString isEqualToString:@"Blogs"]) {
        details = [UIAppDelegate.blogssummaryArray objectAtIndex:indexPath.row];
    }
    else {
           details = [UIAppDelegate.newssummaryArray objectAtIndex:indexPath.row]; 
    }
	CGSize size = [details sizeWithFont:[UIFont fontWithName:@"Helvetica" size:15] constrainedToSize:textSize lineBreakMode:UILineBreakModeWordWrap];
	return 130-16+size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
    NieuwsViewDetails *objNieuwsDetails;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        objNieuwsDetails= [[NieuwsViewDetails alloc]initWithNibName:@"NieuwsViewDetails~ipad" bundle:nil];
    }
    else{
        objNieuwsDetails= [[NieuwsViewDetails alloc]initWithNibName:@"NieuwsViewDetails" bundle:nil];
    }
    
    if ([buttonTitleString isEqualToString:@"Blogs"]) {
        objNieuwsDetails.newsIdString = [UIAppDelegate.blogsIdArray objectAtIndex:indexPath.row];
        objNieuwsDetails.newsDateString = [UIAppDelegate.blogsDateArray objectAtIndex:indexPath.row];
        objNieuwsDetails.newsAuthorString = [UIAppDelegate.blogsAuthorArray objectAtIndex:indexPath.row];
        objNieuwsDetails.newsTitleString = [UIAppDelegate.blogsTitleArray objectAtIndex:indexPath.row];
        objNieuwsDetails.newsImageString = [UIAppDelegate.blogsImageArray objectAtIndex:indexPath.row];
        objNieuwsDetails.newsUserId = [UIAppDelegate.blogsUserIdArray objectAtIndex:indexPath.row];
        objNieuwsDetails.newsTocusString = [UIAppDelegate.blogsTocusArray objectAtIndex:indexPath.row];
    }
    else {
           objNieuwsDetails.newsIdString = [UIAppDelegate.newsIdArray objectAtIndex:indexPath.row];
           objNieuwsDetails.newsDateString = [UIAppDelegate.newsDateArray objectAtIndex:indexPath.row];
           objNieuwsDetails.newsAuthorString = [UIAppDelegate.newsAuthorArray objectAtIndex:indexPath.row];
           objNieuwsDetails.newsTitleString = [UIAppDelegate.newstitleArray objectAtIndex:indexPath.row];
           objNieuwsDetails.newsImageString = [UIAppDelegate.newsImageArray objectAtIndex:indexPath.row];
           objNieuwsDetails.newsUserId = [UIAppDelegate.newsuserIdArray objectAtIndex:indexPath.row];
           objNieuwsDetails.newsTocusString = [UIAppDelegate.newsTocusArray objectAtIndex:indexPath.row];
    }
   
        [self presentModalViewController:objNieuwsDetails animated:NO];
}

#pragma mark -
#pragma mark Deferred image loading (UIScrollViewDelegate)

// Load images for all onscreen rows when scrolling is finished
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
	{
      [self loadImagesForOnscreenRows];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self loadImagesForOnscreenRows];
}

//calling the service on scrollViewDidScroll
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float scrollViewHeight = scrollView.frame.size.height;
    float scrollContentSizeHeight = scrollView.contentSize.height;
    float scrollOffset = scrollView.contentOffset.y;
    if (scrollOffset + scrollViewHeight == scrollContentSizeHeight)
    {
        if (flag == false) {
            limitCount = limitCount + [UIAppDelegate.countString intValue];
            NSString *stringParams;
            if ([buttonTitleString isEqualToString:@"Nieuws"]) {
                stringParams=[NSString stringWithFormat:@"method=getLatestNews&deviceId=%@&intraid=%@&searchkeyword=%@&limit=%d&categorie=%@",UIAppDelegate.deviceIdString,UIAppDelegate.intraidString,UIAppDelegate.searchString,limitCount,UIAppDelegate.categoryIdString];
                
            } else if ([buttonTitleString isEqualToString:@"Blogs"]) {
                stringParams=[NSString stringWithFormat:@"method=getBlogdetail&deviceId=%@&intraid=%@&searchkeyword=%@&limit=%d&categorie=%@",UIAppDelegate.deviceIdString,UIAppDelegate.intraidString,UIAppDelegate.searchString,limitCount,UIAppDelegate.categoryIdString];
            }
            [self performSelectorInBackground:@selector(loadActivityView) withObject:nil];
             [objCallWS callNieuwsWebService:stringParams:buttonTitleString];
            if ([UIAppDelegate.countString isEqualToString:@"0"]) {
                flag = true;
                [loaderView stopAnimating];
                [loaderView setHidesWhenStopped:YES];
                loadingLabel.hidden = YES;
            }
            else {
                [loaderView stopAnimating];
                [loaderView setHidesWhenStopped:YES];
                loadingLabel.hidden = YES;
                [self.nieuwsDetailsTableView reloadData];
            }
        }
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

//showing the loader view method
- (void)loadActivityView {
    [[loaderView layer] setCornerRadius:5];
    [loaderView setClipsToBounds:YES];
    [[loaderView layer] setBorderColor:
    [[UIColor blackColor] CGColor]];
    [loaderView startAnimating];
	loaderView.hidden=NO;
    self.loadingLabel.hidden = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIAppDelegate.imagevalue=0;
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    //loading the user defaults from login view
    defaults = [NSUserDefaults standardUserDefaults];
    UIAppDelegate.deviceIdString=[defaults valueForKey:@"deviceId"];
    UIAppDelegate.intraidString=[defaults valueForKey:@"intraid"];
    UIAppDelegate.categoryIdString=[defaults valueForKey:@"categorieId"];
    UIAppDelegate.CMSUrlString = [defaults valueForKey:@"mobileurl"];
    UIAppDelegate->cmsImageURL = [defaults valueForKey:@"logo"];
    [self.nieuwsDetailsTableView deselectRowAtIndexPath:
    [self.nieuwsDetailsTableView indexPathForSelectedRow] animated:animated];
    if(UIAppDelegate.cmsImageData==nil) {
    }
    else {
           logoImageView.image=[UIImage imageWithData: UIAppDelegate.cmsImageData];
     }
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
