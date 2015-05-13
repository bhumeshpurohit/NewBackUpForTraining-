//
//  ViewController.m
//  TableViewWithImage
//
//  Created by Bhumesh on 12/05/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import "ViewController.h"
#import "SimpleTableViewCell.h"

@interface ViewController ()

{
    NSArray *Items;
    NSArray *Thumbnail;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    static NSString *simpleTableId=@"Simple Table Items";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableId];
    }
    cell.textLabel.text=[Items objectAtIndex:indexPath.row];
    
    cell.imageView.image=[UIImage imageNamed:[Thumbnail objectAtIndex:indexPath.row]];
    
    
    
    
   
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
