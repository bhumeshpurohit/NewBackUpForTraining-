//
//  ContactenView.m
//  PortalCMS
//
//  Created by Etisbew on 05/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContactenView.h"

@interface ContactenView ()

@end

@implementation ContactenView
@synthesize logoImageView;
@synthesize titleLabel;
@synthesize contactenDetailsTableView;
@synthesize usersNameArray;
@synthesize bgImgLabel;
@synthesize loadingLabel;
@synthesize limitCount;
@synthesize loaderView;

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
    [self.norecord setHidden:YES];
    // Do any additional setup after loading the view from its nib.
    limitCount = 0;
    alimitCount = 0;
    flag = false;
    aflag=false;
    alphabetArray=[[NSMutableArray alloc]init];
    //loading the user defaults from login view
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    UIAppDelegate.deviceIdString=[defaults valueForKey:@"deviceId"];
    UIAppDelegate.intraidString=[defaults valueForKey:@"intraid"];
    UIAppDelegate.CMSUrlString = [defaults valueForKey:@"mobileurl"];
    UIAppDelegate->cmsImageURL = [defaults valueForKey:@"logo"];
    objCallWS = [[WebService alloc]init];
    [self loadImageViewElements];
    sectionArray=[[NSMutableArray alloc] init];
    fContact=[[NSMutableArray alloc]initWithCapacity:0];
    sectionArray=[NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    self.contactenDetailsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
// ********For contact type table view was removed as per instructions *********
//    UIAppDelegate.contactsArray=[[UIAppDelegate.contactsArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
//        NSString *first = [(ContactenClass*)a usersNameString];
//        NSString *second = [(ContactenClass*)b usersNameString];
//        return [first compare:second];
//    }] mutableCopy];
//    //[contactsTempArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];  // will sort the array in ascending order
//    [self createAlphabetArray];
}

//calling service for Contacts
- (void) loadImageViewElements {
    self.bgImgLabel.backgroundColor = [UIColor whiteColor];
    self.bgImgLabel.layer.masksToBounds = YES;
    self.bgImgLabel.layer.cornerRadius = 10.0;
    self.titleLabel.layer.masksToBounds = YES;
    self.titleLabel.layer.cornerRadius = 6.0;
    outlineLabel.layer.masksToBounds = YES;
    outlineLabel.layer.cornerRadius = 10.0;
    outlineLabel.layer.masksToBounds = YES;
    outlineLabel.layer.cornerRadius = 6.0;
    self.contactenDetailsTableView.layer.cornerRadius = 10.0;
    self.contactenDetailsTableView.separatorColor = [UIColor darkGrayColor];
    UITapGestureRecognizer *itemImageTap= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backToBeforeView:)];
    itemImageTap.numberOfTapsRequired =1;
    itemImageTap.delegate = self;
    [logoImageView addGestureRecognizer:itemImageTap];    
    
    // Chechking the response whether UserNameArray is nil or not
    if([self.usersNameArray count] > 0 && self.usersNameArray!=nil)
        UIAppDelegate.contactsArray = self.usersNameArray;
    if (UIAppDelegate.isNetworkIsAvailable == NO) {
        if ([UIAppDelegate.contactsArray count] == 0)
        {//bhushan1
            flag = true;
            self.contactenDetailsTableView.hidden = YES;
            recordsTitleLabel.hidden = NO;
            outlineLabel.hidden = NO;
        }
        else {
               [contactenDetailsTableView reloadData];
             }
        
    }  else {

        if ([UIAppDelegate.contactsArray count] == 0)
        {//bhushan2
            flag = true;
            self.contactenDetailsTableView.hidden = YES;
            recordsTitleLabel.hidden = NO;
            outlineLabel.hidden = NO;
        }
        else {
                [self.norecord setHidden:YES];
            }
    }
}

- (void)backToBeforeView:(UITapGestureRecognizer*)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Table View 
// ********For contact type table view was removed as per instructions *********
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return alphabetArray.count;
//}
//-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    NSString *title;
//    for (int i=0; i<alphabetArray.count; i++)
//    {
//        if (section==i)
//        {
//            title= [alphabetArray objectAtIndex:i];
//        }
//    }
//    return title;
//}
//-(NSMutableArray *)getArrayOfRowsForSection:(NSInteger)section
//{
//    NSString *rowTitle;
//    NSString *sectionTitle;
//    NSMutableArray *rowContainer=[[NSMutableArray alloc]initWithCapacity:0];
//    fContact=[[NSMutableArray alloc]initWithCapacity:0];
//    NSMutableArray *tst=UIAppDelegate.contactsArray;
//    for (int i=0; i<alphabetArray.count; i++)
//    {
//        
//        if (section==i)   // check for right section
//        {
//            sectionTitle= [alphabetArray objectAtIndex:i];  //getting section title
//            
//            for (ContactenClass *title in UIAppDelegate.contactsArray)
//            {
//                NSArray *substrings = [title.usersNameString componentsSeparatedByString:@" "];
//                if([[substrings objectAtIndex:substrings.count-1] length]>0)
//                {
//                    rowTitle=[[substrings objectAtIndex:substrings.count-1] substringToIndex:1];  //modifying the statement to its first alphabet
//                    if ([rowTitle isEqualToString:sectionTitle])  //checking if modified statement is same as section title
//                    {
//                        [rowContainer addObject:title.usersNameString];
//                        [fContact addObject:title];
//                    //adding the row contents of a particular section in array
//                    }
//                }
//                else{
//                    [rowContainer addObject:@""];
//                }
//            }
////            sectioncount=[[NSDictionary alloc]init];
////            [sectioncount setValue:[NSString stringWithFormat:@"%d",rcnt] forKey:[NSString stringWithFormat:@"%d",section] ];
//            //rcnt=rcnt+1;
//            
//        }
//        
//    }
//    return rowContainer;
//}
-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
    if(table.tag==0)
    {
	return [UIAppDelegate.contactsArray count];
    }
    else if (table.tag==2)
    {
        return [sectionArray count];
    }
    else
    {
        return 0;
    }
    // ********For contact type table view was removed as per instructions *********
//    NSMutableArray* rowArray=[[NSMutableArray alloc]initWithCapacity:0];
//    rowArray=[self getArrayOfRowsForSection:section];
//    return rowArray.count;
}
// ********For contact type table view was removed as per instructions *********
//-(NSString *)titleForRow:(NSIndexPath *)indexpath
//{
//    NSMutableArray* rowArray=[[NSMutableArray alloc]initWithCapacity:0];
//    rowArray=[self getArrayOfRowsForSection:indexpath.section];
//    NSString *titleToBeDisplayed=[rowArray objectAtIndex:indexpath.row];
//    return titleToBeDisplayed;
//    
//}
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    return [NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
//    //return alphabetArray;
//}

//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
//    return [alphabetArray indexOfObject:title];
//}
// Customize the appearance of table view cells.
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	static NSString *cellIdentifier = @"cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if(cell == nil)
	{
      cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] ;
	} 
     cell.textLabel.textColor = [UIColor colorWithRed:102/255.0 green:153/255.0 blue:255/255.0 alpha:1];
    //cell.textLabel.text= [self titleForRow:indexPath];
     cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    
    if(tableView.tag==0)
    {
        ContactenClass *objClass=[UIAppDelegate.contactsArray objectAtIndex:indexPath.row];
        
        
	 cell.textLabel.text = objClass.usersNameString;
    }
    else if(tableView.tag==2)
    {
        cell.textLabel.text = [sectionArray objectAtIndex:indexPath.row];
    }
    
   
    
     return cell;
}
//loading the Activity loader
- (void)loadActivityView
{
    [loaderView setClipsToBounds:YES];
    [loaderView startAnimating];
	loaderView.hidden=NO;
    self.loadingLabel.hidden = NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView.tag==0)
    {
        limitCount = limitCount + [UIAppDelegate.countString intValue];
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            ContactenViewDetails *objContactenDetails = [[ContactenViewDetails alloc]initWithNibName:@"ContactenViewDetails~ipad" bundle:nil];
            
            ContactenClass *objClass=[UIAppDelegate.contactsArray objectAtIndex:indexPath.row];
            
            
            objContactenDetails.objClass = objClass;
            
            [self presentModalViewController:objContactenDetails animated:NO];
        }
        else{
            ContactenViewDetails *objContactenDetails = [[ContactenViewDetails alloc]initWithNibName:@"ContactenViewDetails" bundle:nil];
            
            ContactenClass *objClass=[UIAppDelegate.contactsArray objectAtIndex:indexPath.row];
            
            
            objContactenDetails.objClass = objClass;
            
            [self presentModalViewController:objContactenDetails animated:NO];
        }
        
        
    
    }
    else if(tableView.tag==2)
    {
        stringParams=[NSString stringWithFormat:@"method=getUserList&deviceId=%@&intraid=%@&alphabet=%@&limit=0",UIAppDelegate.deviceIdString,UIAppDelegate.intraidString,[sectionArray objectAtIndex:indexPath.row]];
        
        [self performSelectorInBackground:@selector(indicatorView) withObject:nil];
        
        flag =false;
        aflag=true;
        alimitCount=0;
        
        UIAppDelegate.contactsArray = [objCallWS callContactenClassServiceA:stringParams];
        
        
        if([UIAppDelegate.contactsArray count]>0)
        {
             [self.norecord setHidden:YES];
        }
        else{
             [self.norecord setHidden:NO];
        }
        [self.contactenDetailsTableView reloadData];
       
    }
}


//calling the service on scrollViewDidScroll
-(int) findObjectIndexAtSection:(int)Section AtIndext:(int)index
{
    int total=0;
    int rcnt=0;
    for(int i=0; i<[UIAppDelegate.contactsArray count]; i++)
    {
            NSString *sectionTitle= [alphabetArray objectAtIndex:i];
            int j=0;
            for (ContactenClass *title in UIAppDelegate.contactsArray)
            {
                
               NSArray *substrings = [title.usersNameString componentsSeparatedByString:@" "];
                if([[substrings objectAtIndex:substrings.count-1] length]>0)
                {
                    NSString * rowTitle=[[substrings objectAtIndex:substrings.count-1] substringToIndex:1];
               // NSString *rowTitle=[title.usersNameString substringToIndex:1];  //modifying the statement to its first alphabet
                    if ([rowTitle isEqualToString:sectionTitle])  //checking if modified statement is same as section title
                    {
                    
                        if(j==index && Section==i)
                        {
                            return total;
                        }
                        rcnt=rcnt+1;
                        j=j+1;
                        total=total+1;
                    }
                }
                else{
                    rcnt=rcnt+1;
                    j=j+1;
                    total=total+1;
                }
                
            }
    }
    
    return rcnt+Section;

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
   
    
    float scrollViewHeight = scrollView.frame.size.height;
    float scrollContentSizeHeight = scrollView.contentSize.height;
    float scrollOffset = scrollView.contentOffset.y;
    
    
     if (scrollOffset + scrollViewHeight == scrollContentSizeHeight)
    {
        if (flag == false)
        {
            
            //calling the getUserList webservice and adding to array
            if(aflag==true)
            {
                alimitCount = alimitCount + [UIAppDelegate.countString intValue];
//                stringParams=[NSString stringWithFormat:@"method=getUserList&deviceId=%@&intraid=%@&searchkeyword=%@&limit=%d",UIAppDelegate.deviceIdString,UIAppDelegate.intraidString,UIAppDelegate.searchString,alimitCount];
                
                stringParams=[NSString stringWithFormat:@"method=getUserList&deviceId=%@&intraid=%@&alphabet=%@&limit=%d",UIAppDelegate.deviceIdString,UIAppDelegate.intraidString,[sectionArray objectAtIndex:[self.alphabetTableView indexPathForSelectedRow].row],alimitCount];
            }
            else{
                limitCount = limitCount + [UIAppDelegate.countString intValue];
                stringParams=[NSString stringWithFormat:@"method=getUserList&deviceId=%@&intraid=%@&searchkeyword=%@&limit=%d",UIAppDelegate.deviceIdString,UIAppDelegate.intraidString,UIAppDelegate.searchString,limitCount];
            }
            
            
            [self performSelectorInBackground:@selector(loadActivityView) withObject:nil];
            
            contactsTempArray=[[NSMutableArray alloc]init];
            
            contactsTempArray = [objCallWS callContactenClassService:stringParams];
            
            
        if ([contactsTempArray count] == 0)
        {//bhushan3
           // flag = true;
            [loaderView stopAnimating];
            [loaderView setHidesWhenStopped:YES];
            loadingLabel.hidden = YES;
        }
        else {
            for(int i=0;i<[contactsTempArray count];i++)
            {
                [UIAppDelegate.contactsArray addObject:[contactsTempArray objectAtIndex:i ]];
            }
            [loaderView stopAnimating];
            [loaderView setHidesWhenStopped:YES];
            loadingLabel.hidden = YES;
            alphabetArray=[[NSMutableArray alloc]init];
            [self createAlphabetArray];
            [self.contactenDetailsTableView reloadData];
          }
       }
    
    }
}
-(void)createAlphabetArray
{
    alphabetArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (int i=0; i< UIAppDelegate.contactsArray.count; i++)
    {
        ContactenClass *c1=[UIAppDelegate.contactsArray objectAtIndex:i];
        NSArray *substrings = [c1.usersNameString componentsSeparatedByString:@" "];
        if([[substrings objectAtIndex:substrings.count-1] length]>0)
        {
            NSString * rowTitle=[[substrings objectAtIndex:substrings.count-1] substringToIndex:1];
            NSString *firstletter=[rowTitle substringToIndex:1];  //modifying the statement to first letter
            if (![alphabetArray containsObject:firstletter])  //checking the array if the modified statement already exists in array
            {
                [alphabetArray addObject:firstletter];
            }
        }
        else{
            c1.usersNameString=[NSString stringWithFormat:@"%@%@",c1.usersNameString,@"."];
            NSString *firstletter=@".";
            if (![alphabetArray containsObject:firstletter])  //checking the array if the modified statement already exists in array
            {
                [alphabetArray addObject:firstletter];
            }
        }
    }
    [alphabetArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];   //sorting array in ascending array
    
}

- (void) indicatorView {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

- (void)viewWillAppear:(BOOL)animated
{
    flag=NO;
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    UIAppDelegate->cmsImageURL = [defaults valueForKey:@"logo"];
    [self.contactenDetailsTableView deselectRowAtIndexPath:[self.contactenDetailsTableView indexPathForSelectedRow] animated:animated];
    if(UIAppDelegate.cmsImageData==nil) {
    }    
    else {
//        logoImageView.frame=CGRectMake(110, 15, 97, 47);
        logoImageView.image=[UIImage imageWithData: UIAppDelegate.cmsImageData];
    }
}
-(IBAction)back:(id)sender
{
    UIAppDelegate.imagevalue=1;
    [self dismissModalViewControllerAnimated:YES];
}
- (void)viewDidUnload
{
    outlineLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
