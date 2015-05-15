//
//  ViewController.m
//  CustomTableView
//
//  Created by Bhumesh on 12/05/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import "ViewController.h"
#import "SimpleTableCell.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *Items;
    NSArray *Thumbnail;
    BOOL *Flag;
    NSArray * keys;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    Flag =TRUE;
    Items=[NSArray arrayWithObjects:@"Tea",@"Sandwich",@"Coffee",@"Noodles",@"Milk",@"Fruit Juice",nil];
    Thumbnail=[NSArray arrayWithObjects:@"Tea.jpg",@"Sandwich.jpg",@"coffee.jpg",@"noodles.jpg",@"Milk.jpg",@"Juice.jpg",nil];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Items count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.nameLabel.text = [Items objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[Thumbnail objectAtIndex:indexPath.row]];
   
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*UIAlertView *messageAlert = [[UIAlertView alloc]
     initWithTitle:@"Row Selected" message:@"You've selected a row" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
     
     // Display Alert Message
     [messageAlert show];*/
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(Flag)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark	;
        Flag=FALSE;
    }
    else{
        cell.accessoryType=UITableViewCellAccessoryNone;
        Flag=TRUE;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
