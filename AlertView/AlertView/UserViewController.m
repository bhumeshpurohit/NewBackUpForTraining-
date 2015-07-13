//
//  UserViewController.m
//  AlertView
//
//  Created by Bhumesh on 05/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController
@synthesize name;
@synthesize pass;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    NSString *name1 =@"User Name: ";
    name1 = [name1 stringByAppendingString:self.UserName];
    NSString *pass1=@"Password: ";
    pass1 = [pass1 stringByAppendingString:self.Password];
    name.text=name1;
    pass.text=pass1;
    
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

@end
