//
//  WikiView.h
//  PortalCMS
//
//  Created by Etisbew on 05/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTreeNode.h"
#import "MyTreeViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "WikiviewDetails.h"
#import "MBProgressHUD.h"
#import "WikiParentClass.h"
#import "WikiSearchClass.h"
#import "XMLTreeNode.h"
#import "XMLTreeParser.h"
#import "LoginView.h"
@interface WikiView : UIViewController<UIGestureRecognizerDelegate>
{
    
    UITableView *tableview;
    UIImageView *logoImageView;
    UILabel *labelTitle;
    UILabel *bgImgLabel;
    NSMutableArray *wikiParentDetailsArray;
    NSMutableArray *wikiNamesArray;
    NSString *stringParams;
    NSMutableArray *wikiIdArray;
    NSMutableArray *wikiCountArray;
    NSMutableArray *wikiChildDetailsArray;
    NSArray* searchIdArray;
    NSString *wikisearchString;
    NSString *treeIdsString;
    NSString *treeIds;
    UIScrollView *scrollView;
    UIImageView *bg;
    MyTreeNode *treeNode; 
    WikiChildClass *wiki;
    MyTreeViewCell *cell;
 }
@property (nonatomic,strong) NSString *wikisearchString;
@property (nonatomic,retain) NSString *stringParams;
@property (nonatomic,strong) NSMutableArray *wikiCountArray;
@property (nonatomic,retain) NSMutableArray *wikiNamesArray;
@property (nonatomic,retain) NSMutableArray *wikiIdArray;
@property (nonatomic,retain) NSMutableArray *wikiParentDetailsArray;
@property (nonatomic,retain) NSMutableArray *wikiChildDetailsArray;
@property (nonatomic,retain) IBOutlet UIImageView *logoImageView; 
@property (nonatomic,retain) IBOutlet UILabel *labelTitle;
@property (nonatomic,strong) IBOutlet UILabel *bgImgLabel;
@property (nonatomic,retain) IBOutlet UITableView *tableview;
@property (nonatomic,strong) IBOutlet UIImageView *bg;
@property (nonatomic,strong) IBOutlet UIScrollView *scrollView;

- (void) wikiTreeNodeElements;
- (void) loadImageViewElements;
-(XMLTreeNode*)XmlChild:(XMLTreeNode*) treeNodeparam :(MyTreeNode*)node;
@end
