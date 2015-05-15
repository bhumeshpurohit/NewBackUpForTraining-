//
//  ViewController.m
//  DeleteTableCell
//
//  Created by Bhumesh on 12/05/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *Name;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    Name=[NSMutableArray arrayWithObjects:@"Ankur",@"Bhumesh",@"Chirag",@"Disha",@"Esha",@"Fenil", nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Name count];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [Name removeObjectAtIndex:indexPath.row];
    
    [tableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableId=@"Simple Table Items";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableId];
  
    if(cell == nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableId];
        
    }

   
    
    cell.textLabel.text=[Name objectAtIndex:indexPath.row];
    return cell;
}
@end
