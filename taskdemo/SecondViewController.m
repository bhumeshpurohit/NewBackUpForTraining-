//
//  SecondViewController.m
//  taskdemo
//
//  Created by Bhumesh on 25/05/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//
#import "aViewController.h"
#import "SecondViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize tableview;
@synthesize titleStr;
@synthesize desc;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@",titleStr);
    
   
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 250, 250)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    [headerView addSubview:imageView];
    
    UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(125, 25, 140, 45)];
    [headerView addSubview:labelView];
    

    self.tableview.tableHeaderView=headerView;
  
    
    // header dynamic height
    
    CGRect newFrame = self.tableview.tableHeaderView.frame;
    newFrame.size.height = newFrame.size.height + 100;
    self.tableview.tableHeaderView.frame = newFrame;

    
    //for set image from other class
    imageView.image=self.img;
    imageView.layer.cornerRadius =10.0f;
    imageView.layer.borderColor = [[UIColor blackColor] CGColor];
    imageView.layer.borderWidth =.4f;
    imageView.layer.masksToBounds = YES;
    //for set text from other class
   // NSString *xval= [NSString stringWithFormat:@"%s",@"Title"];

    labelView.text=[@"Title:-  " stringByAppendingString:titleStr];
   
    
    // CGSize maximumLabelSize = CGSizeMake(280,1000);
     NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIFont fontWithName:@"FontName" size:15], NSFontAttributeName,
                                          nil];
    CGRect frame=[desc boundingRectWithSize:CGSizeMake(400, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDictionary context:nil];
    CGSize lblSize = [desc sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize: CGSizeMake(200.0f, 600.0f) lineBreakMode: NSLineBreakByWordWrapping];
    UILabel *labelDesc = [[UILabel alloc] initWithFrame:frame];
    
    labelDesc.frame = CGRectMake(20, 120, 330, lblSize.height);
    labelDesc.numberOfLines = 0;
    labelDesc.lineBreakMode = NSLineBreakByWordWrapping;
    labelDesc.font = [UIFont systemFontOfSize:15];
    labelDesc.text = desc;
    labelDesc.backgroundColor = [UIColor clearColor];
    [labelDesc sizeToFit];
    
    headerView.frame = CGRectMake(20, 50, 200, lblSize.height);
    [headerView sizeToFit];
    [headerView addSubview:labelDesc];
      headerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableview.tableHeaderView=headerView;
   
  // self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0,lblSize.height+150 , self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    // [self.tableview setDataSource:self];ftable
    //[self.tableview setDelegate:self];
    //    [self.tableview setShowsVerticalScrollIndicator:NO];
    //    self.tableview.translatesAutoresizingMaskIntoConstraints = NO;
    //    self.tableview.rowHeight = UITableViewAutomaticDimension;
   // [self.view addSubview:self.tableview];

    
    
    
   }

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *CellIdentifier = @"SectionHeader";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (headerView == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    UILabel *label = (UILabel *)[headerView viewWithTag:123];
    [label setText:@"New Title"];
        return headerView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
