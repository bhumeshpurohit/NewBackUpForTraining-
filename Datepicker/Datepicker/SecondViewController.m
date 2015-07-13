
//
//  SecondViewController.m
//  Datepicker
//
//  Created by Bhumesh on 18/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initV];
    // Do any additional setup after loading the view.
}
-(void) initV
{
    self.txtDate.text=self.str;
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back:(id)sender {
//    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//   
//                         ViewController *vc=(ViewController *)[story instantiateViewControllerWithIdentifier:@"view"];
//    [self.navigationController pushViewController:vc animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
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
