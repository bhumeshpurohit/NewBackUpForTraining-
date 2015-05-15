//
//  ViewController.m
//  New_Login_Demo
//
//  Created by Bhumesh on 01/05/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Click:(id)sender
{
        if([[self.Name text] isEqualToString:@"Bhumesh"] && [[self.Password text] isEqualToString:@"bhumesh123#"])
        {
            [self.Title setText:@"Login Success"];
        }
    else
    {
    [self.Title setText:@"Login Failed"];
    }
}
@end
