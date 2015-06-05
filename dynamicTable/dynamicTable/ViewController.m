//
//  ViewController.m
//  dynamicTable
//
//  Created by Bhumesh on 03/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSMutableArray *arr;
@end
@implementation ViewController
@synthesize arr;
-(void)viewWillAppear:(BOOL)animated
{
    arr=[[NSMutableArray alloc] init];
    [self.arr addObject:@"This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now"];
      [self.arr addObject:@"This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now"];
      [self.arr addObject:@"This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now"];
      [self.arr addObject:@"This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now"];
      [self.arr addObject:@"This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now"];
    [self.arr addObject:@"This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now"];
      [self.arr addObject:@"This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now. This is long long description text which should not get override, which we wil be testing it right now"];
//    self.tblView.estimatedRowHeight = 100.0;
//    self.tblView.rowHeight = UITableViewAutomaticDimension;
//    [self.tblView setNeedsUpdateConstraints];
//    [self.tblView setNeedsLayout];
//    [self.tblView needsUpdateConstraints];
//    [self.tblView setNeedsUpdateConstraints];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    [self.tblView reloadData];
}
#pragma mark TableView Delegates
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arr count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell1"];
    cell.detailTextLabel.text = [arr objectAtIndex:indexPath.row];
    [cell.detailTextLabel setNeedsLayout];
    [cell.detailTextLabel setNeedsDisplay];
    self.tblView.estimatedRowHeight = 100.0;
    self.tblView.rowHeight = UITableViewAutomaticDimension;
    [self.tblView setNeedsUpdateConstraints];
    [self.tblView setNeedsLayout];
    [self.tblView needsUpdateConstraints];
    [self.tblView setNeedsUpdateConstraints];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  UITableViewAutomaticDimension;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
