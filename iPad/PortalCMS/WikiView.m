//
//  WikiView.m
//  PortalCMS
//
//  Created by Etisbew on 05/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WikiView.h"
#import "MyTreeViewCell.h"


@interface WikiView ()

@end

@implementation WikiView
@synthesize tableview;
@synthesize labelTitle;
@synthesize logoImageView;
@synthesize wikiParentDetailsArray = _wikiParentDetailsArray;
@synthesize wikiNamesArray = _wikiNamesArray;
@synthesize wikiChildDetailsArray = _wikiChildDetailsArray;
@synthesize stringParams;
@synthesize wikiIdArray = _wikiIdArray;
@synthesize bgImgLabel;
@synthesize wikisearchString;
@synthesize wikiCountArray;
@synthesize scrollView;
@synthesize bg;


int cnt;

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
    // Do any additional setup after loading the view from its nib.
    [self.scrollView setContentSize:CGSizeMake(420,scrollView.frame.size.height)];
    self.wikiNamesArray = [[NSMutableArray alloc]init];
    self.wikiIdArray = [[NSMutableArray alloc]init];
    self.wikiCountArray = [[NSMutableArray alloc]init];
    [self loadImageViewElements];
    
    //loading the user defaults from login view 
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    UIAppDelegate.deviceIdString=[defaults valueForKey:@"deviceId"];
    UIAppDelegate.intraidString=[defaults valueForKey:@"intraid"];
    UIAppDelegate.CMSUrlString = [defaults valueForKey:@"mobileurl"];
    [self wikiTreeNodeElements];
}

//Adjusting the view frames
- (void) loadImageViewElements {
    self.bgImgLabel.backgroundColor = [UIColor whiteColor];
    self.bgImgLabel.layer.masksToBounds = YES;
    self.bgImgLabel.layer.cornerRadius = 6.0;
    labelTitle.layer.masksToBounds = YES;
    labelTitle.layer.cornerRadius = 6.0;
    self.tableview.layer.cornerRadius = 6.0;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.layer.masksToBounds = YES;
    scrollView.layer.cornerRadius = 6.0;
    self.scrollView.layer.cornerRadius = 6.0;
    self.bg.backgroundColor = [UIColor whiteColor];
    self.bg.layer.masksToBounds = YES;
    self.bg.layer.cornerRadius = 6.0;
    UITapGestureRecognizer *itemImageTap= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backToBeforeView:)];
    itemImageTap.numberOfTapsRequired =1;
    itemImageTap.delegate = self;
    [logoImageView addGestureRecognizer:itemImageTap];
    
    //Adding the Root nodes from View source
    for(WikiParentClass *wikiParent in self.wikiParentDetailsArray)
    {
        [self.wikiIdArray addObject:wikiParent.WikiIdString];
        if (wikisearchString!=nil && [wikisearchString length] > 0 && UIAppDelegate.searchString!=nil && [UIAppDelegate.searchString length] > 0) {
            [self.wikiCountArray addObject:wikiParent.WikiCountString];
            wikiParent.WikiNameString = [NSString stringWithFormat:@"%@(%@)",wikiParent.WikiNameString,wikiParent.WikiCountString];
            [self.wikiNamesArray addObject:wikiParent.WikiNameString];
        }
        else {
                [self.wikiNamesArray addObject:wikiParent.WikiNameString];
        }
    }
}

//Displaying the Root nodes from View source
- (void) wikiTreeNodeElements {
    treeNode = [[MyTreeNode alloc] initWithValue:@"Root"];
    for (int i=0; i<[self.wikiNamesArray count]; i++) {
        MyTreeNode *node1 = [[MyTreeNode alloc] initWithValue:[self.wikiNamesArray objectAtIndex:i]];
        node1.imgNode=[UIImage imageNamed:@"closedfolder.png"];
        node1.inclusive = NO;
        node1.nodeIdString=@"0";
        if(wikisearchString.length>0)
        {
            node1.isSearched=true;
        }
        node1.rootNodeId=[self.wikiIdArray objectAtIndex:i];
        [treeNode addChild:node1];
    } 
}

#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [treeNode descendantCount];
}

// Customize the appearance of table view cells.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    [tableView setBackgroundView:bg];
    tableView.frame = CGRectMake(tableView.frame.origin.x, tableView.frame.origin.y, scrollView.contentSize.width, tableView.frame.size.height);
    tableView.backgroundColor = [UIColor clearColor];
   	MyTreeNode *node = [[treeNode flattenElements] objectAtIndex:indexPath.row + 1];
    if(wikisearchString.length>0 && ![wikisearchString isEqualToString:@""]  && UIAppDelegate.searchString!=nil && [UIAppDelegate.searchString length] > 0)
    {
	cell = [[MyTreeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier
														   level:[node levelDepth] - 1 
														  expanded:node.inclusive
                                                            isSearched:YES
                                                        childran:node
                                                       nodeImage:node.imgNode];
        cell.valueLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    }
    else{
        cell = [[MyTreeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier
                                               level:[node levelDepth] - 1
                                            expanded:node.inclusive
                                          isSearched:NO
                                            childran:node
                                           nodeImage:node.imgNode];
    }

//    if ([searchIds containsObject:node.nodeIdString]) {

//        cell.valueLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
//    }
    
    cell.valueLabel.text = node.value;
    cell.valueLabel.numberOfLines = 2;
    
   return cell;
}

//Adding and creating the child nodes
- (XMLTreeNode*)XmlChild:(XMLTreeNode*) treeNodeparam :(MyTreeNode*)node
{
    XMLTreeNode *subchild;
    if([[treeNode children] count]>0)
    {
        
        NSArray* stuffs = [treeNodeparam findChildren:@"child"];
        cnt++;
        for(int i=0;i<[stuffs count];i++)
        {
            MyTreeNode *node3a;
            XMLTreeNode* stuff = [stuffs objectAtIndex:i];  
            XMLTreeNode *Name = (XMLTreeNode *)[stuff findChild:@"name"];
            XMLTreeNode *Id = (XMLTreeNode *)[stuff findChild:@"id"];
            XMLTreeNode *isparent = (XMLTreeNode *)[stuff findChild:@"isparent"];
            XMLTreeNode *children = (XMLTreeNode *)[stuff findChild:@"children"];
            node3a = [[MyTreeNode alloc] initWithValue:wiki.nameString];
            node3a.nodeIdString= [Id text];
            node3a.rootNodeId=node.rootNodeId;
            node3a.nodeTitle = [Name text];
            node3a.value=[Name text];
            node3a.inclusive = YES;
            if([[isparent text] isEqualToString:@"1"])
            {
                if ([[children children] count] >0) {
                    node3a.imgNode=[UIImage imageNamed:@"openfolder"]; 
                    node3a.isDocument=NO;
                }
                else {
                    node3a.imgNode=[UIImage imageNamed:@"closedfolder"]; 
                    node3a.isDocument=NO;
                                node3a.inclusive = NO;
                }
            }  
            else {
                node3a.imgNode=[UIImage imageNamed:@"document"];                               
                node3a.isDocument=YES;
            }
            [node addChild:node3a];
            [self XmlChild:children:node3a];           
        }
    }
    return subchild;
}

#pragma mark 
#pragma mark Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSelectorInBackground:@selector(indicatorView) withObject:nil];  
    MyTreeNode *node = [[treeNode flattenElements] objectAtIndex:indexPath.row + 1];
    NSString *strid = node.nodeIdString;
    NSString *nodeId=node.rootNodeId;
    MyTreeNode *node3a;
   if(!node.isDocument)
   {
    if(!node.hasChildren)
    {
        WebService *objCallWS = [[WebService alloc]init];
        NSString *stringParam;
        if (wikisearchString!=nil && [wikisearchString length] > 0 && UIAppDelegate.searchString!=nil && [UIAppDelegate.searchString length] > 0) {
            
            //calling the getWikiSearchChild service method
            if (node.nodeId == 1) {
             stringParam=[NSString stringWithFormat:@"method=getWikiSearchChild&deviceId=%@&boekid=%@&searchkeyword=%@",UIAppDelegate.deviceIdString,nodeId,UIAppDelegate.searchString];
           NSData * responseData = [objCallWS callWikiSearchWebService:stringParam];  
            XMLTreeParser *parser = [[XMLTreeParser alloc] init];    
            XMLTreeNode *root = [parser parse:responseData];
            XMLTreeNode *observationNode = (XMLTreeNode *)[root findChild:@"Result"];
            XMLTreeNode *onNode = (XMLTreeNode *)[observationNode findChild:@"children"];
            XMLTreeNode *ontreeIds = (XMLTreeNode *)[observationNode findChild:@"treeids"];
            treeIds = [ontreeIds text];
            searchIdArray  = [treeIds componentsSeparatedByString:@","];
            NSArray* stuffs = [onNode findChildren:@"child"];
                int j=0;
            for(int i=0;i<[stuffs count];i++)
            {
                cnt=0;
                XMLTreeNode* stuff = [stuffs objectAtIndex:i];        
                XMLTreeNode *Name = (XMLTreeNode *)[stuff findChild:@"name"];
                XMLTreeNode *Id = (XMLTreeNode *)[stuff findChild:@"id"];
                XMLTreeNode *children = (XMLTreeNode *)[stuff findChild:@"children"];
                XMLTreeNode *isparent = (XMLTreeNode *)[stuff findChild:@"isparent"];
                node3a = [[MyTreeNode alloc] initWithValue:wiki.nameString];
                node3a.nodeIdString = [Id text];
                node3a.rootNodeId=node.rootNodeId;
                NSString *immutableString = (NSString *)[Name text];
                node3a.nodeTitle = immutableString ;
                
                node3a.value=immutableString;
                node3a.inclusive = YES;
                node3a.isDocument=YES;
                node3a.docData=[UIAppDelegate.wikiChildArray objectAtIndex:j];
                if([[isparent text] isEqualToString:@"1"])
                {             
                    node3a.imgNode=[UIImage imageNamed:@"openfolder"];
                    node3a.isDocument=NO;
                }  
                else {
                    node3a.imgNode=[UIImage imageNamed:@"document"]; 
                    node3a.isDocument=YES;
                    j=j+1;
                    
                }
                [node addChild:node3a];
                [self XmlChild:children:node3a];
            }
        }
            else {
                //Calling the getWikiChild service method
                stringParam=[NSString stringWithFormat:@"method=getWikiChild&deviceId=%@&wikiid=%@&treeid=%@&searchkeyword=%@",UIAppDelegate.deviceIdString,nodeId, strid,UIAppDelegate.searchString];
                [self.wikiChildDetailsArray removeAllObjects];
                self.wikiChildDetailsArray = [objCallWS callWikiChildWebService:stringParam];
                objCallWS = [[WebService alloc]init];
                for(int i=0;i<[ self.wikiChildDetailsArray count];i++)
                {
                    wiki=[self.wikiChildDetailsArray objectAtIndex:i];
                    node3a = [[MyTreeNode alloc] initWithValue:wiki.titleNameString];
                    node3a.docData=[UIAppDelegate.wikiChildArray objectAtIndex:i];
                    node3a.nodeIdString= wiki.treeIdString;
                    node3a.rootNodeId=node.rootNodeId;
                    node3a.nodeTitle = wiki.titleNameString;
                    if([wiki.isParentString isEqualToString:@"1"])
                    {             
                        node3a.inclusive = YES;
                        node3a.imgNode=[UIImage imageNamed:@"closedfolder"];
                    }  
                    else {
                        node3a.isDocument=YES;
                        node3a.imgNode=[UIImage imageNamed:@"document"];                
                    }
                    [node addChild:node3a];
                   }
            }    }
        else {
            stringParam=[NSString stringWithFormat:@"method=getWikiChild&deviceId=%@&wikiid=%@&treeid=%@&searchkeyword=%@",UIAppDelegate.deviceIdString,nodeId, strid,UIAppDelegate.searchString];
            [self.wikiChildDetailsArray removeAllObjects];
            self.wikiChildDetailsArray = [objCallWS callWikiChildWebService:stringParam];
            objCallWS = [[WebService alloc]init];
            for(int i=0;i<[ self.wikiChildDetailsArray count];i++)
            {
                wiki=[self.wikiChildDetailsArray objectAtIndex:i];
                node3a = [[MyTreeNode alloc] initWithValue:wiki.titleNameString];
                node3a.docData=[UIAppDelegate.wikiChildArray objectAtIndex:i];
                node3a.nodeIdString= wiki.treeIdString;
                node3a.rootNodeId=node.rootNodeId;
                node3a.nodeTitle = wiki.titleNameString;
                node3a.isSearched=true;
                if([wiki.isParentString isEqualToString:@"1"])
                {             
                    node3a.inclusive = NO;
                    node3a.imgNode=[UIImage imageNamed:@"closedfolder"];
                }  
                else {
                    node3a.isDocument=YES;
                    node3a.imgNode=[UIImage imageNamed:@"document"];                
                }
                 [node addChild:node3a];
            }
        }
      }
        if(node.inclusive)
          {  
          node.imgNode=[UIImage imageNamed:@"closedfolder"];                           
         }
           else {
                node.imgNode=[UIImage imageNamed:@"openfolder"]; 
         }         
   }
    else
    {
    //calling the wiki details view
      MyTreeNode *node = [[treeNode flattenElements] objectAtIndex:indexPath.row + 1];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            WikiviewDetails *obj=[[WikiviewDetails alloc]initWithNibName:@"WikiviewDetails~ipad" bundle:nil];
            obj.titleString = node.nodeTitle;
            obj.treeId = node.nodeIdString;
            obj.strDesc = node.docData;
            obj.strWikiSearch = wikisearchString;
            [self presentModalViewController:obj animated:YES];
        }
        else{
            WikiviewDetails *obj=[[WikiviewDetails alloc]initWithNibName:@"WikiviewDetails" bundle:nil];
            obj.titleString = node.nodeTitle;
            obj.treeId = node.nodeIdString;
            obj.strDesc = node.docData;
            obj.strWikiSearch = wikisearchString;
            [self presentModalViewController:obj animated:YES];
        }
      
    }
    if (!node.hasChildren) {
        return;
    }
     node.inclusive = !node.inclusive;
    [treeNode flattenElementsWithCacheRefresh:YES];
    [tableView reloadData];
}

- (void)backToBeforeView:(UITapGestureRecognizer*)sender
{
   [self dismissModalViewControllerAnimated:YES];
}

- (void) indicatorView {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [tableview deselectRowAtIndexPath:[tableview indexPathForSelectedRow] animated:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    UIAppDelegate->cmsImageURL = [defaults valueForKey:@"logo"];
    if(UIAppDelegate.cmsImageData==nil) {
    }    
    else {
//          logoImageView.frame=CGRectMake(110, 15, 97, 47);
//           scrollView.frame=CGRectMake(7, logoImageView.frame.size.height+labelTitle.frame.size.height+40,307,scrollView.frame.size.height);
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
