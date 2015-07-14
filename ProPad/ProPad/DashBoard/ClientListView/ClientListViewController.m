//
//  ClientListViewController.m
//  ProPad
//
//  Created by Bhumesh on 02/07/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ClientListViewController.h"
#import "ClientTableViewCell.h"
#import "ClientDetailViewController.h"
#import "FMDBDataAccess.h"
@interface ClientListViewController ()

@end

@implementation ClientListViewController
{
    
    NSMutableArray *aryClientList;
    NSArray *searchResults;
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    self.navigationItem.title=@"Client List";
    FMDBDataAccess *dbAccess = [FMDBDataAccess new];
    aryClientList =[dbAccess getClient];
    NSLog(@"%@",aryClientList);
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    UIBarButtonItem *btnsort = [[UIBarButtonItem alloc]
                                initWithTitle:@"Sort"
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(sortByName:)];
    self.navigationItem.rightBarButtonItem = btnsort;
    [self.tableView setSeparatorColor:[UIColor colorWithRed:(0/255) green:(128/255) blue:(128/255) alpha:1.0]];
}
-(void)viewDidDisappear:(BOOL)animated
{
    self.navigationItem.title = @"Back";
}
-(void)viewWillDisappear:(BOOL)animated:(BOOL)animated
{
    self.navigationItem.title = @"title";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClientDetailViewController *detailViewController = [[ClientDetailViewController alloc] initWithNibName:@"ClientDetailViewController" bundle:nil];
    detailViewController.Client=[aryClientList objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ClientTableViewCell";
    
    ClientTableViewCell *cell = (ClientTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ClientTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        NSString *strFirstName= [[searchResults objectAtIndex:indexPath.row]valueForKey:@"FirstName"];
        NSString *strLastName = [[searchResults objectAtIndex:indexPath.row] valueForKey:@"LastName"];
        
        NSString  *strName = [NSString stringWithFormat:@"%@ %@",strFirstName,strLastName];
        cell.lblClientName.text=strName;
        cell.lblVehicle.text=[[searchResults objectAtIndex:indexPath.row]valueForKey:@"PrimaryChoice"];
        cell.lblDate.text=[[searchResults objectAtIndex:indexPath.row]valueForKey:@"RegistrationDate"];
        
    }
    else {
        // cell.textLabel.text = [Items objectAtIndex:indexPath.row];
        NSString *strFirstName= [[aryClientList objectAtIndex:indexPath.row]valueForKey:@"FirstName"];
        NSString *strLastName = [[aryClientList objectAtIndex:indexPath.row] valueForKey:@"LastName"];
        
        NSString  *strName = [NSString stringWithFormat:@"%@ %@",strFirstName,strLastName];
        
        cell.lblClientName.text=strName;
        //cell.lblClientName.text=[[aryClientList objectAtIndex:indexPath.row]valueForKey:@"FirstName"];
        cell.lblVehicle.text=[[aryClientList objectAtIndex:indexPath.row]valueForKey:@"PrimaryChoice"];
        cell.lblDate.text=[[aryClientList objectAtIndex:indexPath.row]valueForKey:@"RegistrationDate"];
    }
    return cell;
    
}
//* Removing White space at starting. */
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell     forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    FMDBDataAccess *dbAccess = [FMDBDataAccess new];
    NSInteger clientID=[[[aryClientList objectAtIndex:indexPath.row] valueForKey:@"ClientID"] integerValue];
    if([dbAccess deleteclientData:clientID])
    {
        [aryClientList removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    //[aryClientList removeObjectAtIndex:indexPath.row];
    
    [tableView reloadData];
}
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    searchResults = [aryClientList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(FirstName contains[cd] %@ OR LastName contains[cd] %@ OR PrimaryChoice contains[cd] %@)",searchText,searchText,searchText]];
    
    //    NSPredicate *resultPredicate = [NSPredicate
    //                                    predicateWithFormat:@"SELF contains[cd] %@",
    //                                    searchText];
    //
    //    searchResults = [aryClientList filteredArrayUsingPredicate:resultPredicate];
}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [aryClientList count];
        
    }
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */



// In a storyboard-based application, you will often want to do a little preparation before navigation


- (IBAction)sortByName:(id)sender {
    NSSortDescriptor *Descriptor = [[NSSortDescriptor alloc] initWithKey:@"RegistrationDate" ascending:NO];
    
    NSArray *descriptors = [NSArray arrayWithObjects:Descriptor, nil];
    NSArray *sortedArrayOfDictionaries = [aryClientList sortedArrayUsingDescriptors:descriptors];
    aryClientList = sortedArrayOfDictionaries;
    [self.tableView reloadData];
    
}
@end
