//
//  ViewController.m
//  Login_Demo
//
//  Created by Bhumesh on 28/04/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString *_user;
    NSString *_Pass;
}
@property (strong, nonatomic) IBOutlet UITextField *name;

@property (strong, nonatomic) IBOutlet UITextField *pass;
- (IBAction)submit:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)submit:(id)sender {
    [self.name setText:@"Hello"];
}
@end
