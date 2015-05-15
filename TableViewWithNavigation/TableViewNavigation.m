//
//  TableViewNavigation.m
//  TableViewWithNavigation
//
//  Created by Bhumesh on 13/05/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import "TableViewNavigation.h"
#import "ViewController.h"
@interface TableViewNavigation ()

@end

@implementation TableViewNavigation

@synthesize recipeLabel;
@synthesize recipeName;


- (void)viewDidLoad {
    [super viewDidLoad];
    recipeLabel.text = recipeName;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
