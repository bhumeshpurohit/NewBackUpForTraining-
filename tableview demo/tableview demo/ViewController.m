//
//  ViewController.m
//  tableview demo
//
//  Created by Bhumesh on 02/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *item;
}
@synthesize tableview;
- (void)viewDidLoad {
    [super viewDidLoad];
    item=[NSArray arrayWithObjects:@"Anmol",@"Bhumesh",@"Chirag",@"Raj", nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [item count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleIdentifier=@"Identifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleIdentifier];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleIdentifier];
        
    }
    cell.textLabel.text=[item objectAtIndex:indexPath.row];
    return cell;
    
}
@end
