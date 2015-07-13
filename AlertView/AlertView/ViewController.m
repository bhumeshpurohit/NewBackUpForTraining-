//
//  ViewController.m
//  AlertView
//
//  Created by Bhumesh on 05/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"
#import "UserViewController.h"
@interface ViewController () <UIAlertViewDelegate>

@end

@implementation ViewController
@synthesize MyLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Login:(id)sender {
   
    
//   
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Insert your User Name And Password", nil)
    message:NSLocalizedString(@"", nil)
    delegate:self
                          
                                          cancelButtonTitle:NSLocalizedString(@"Ok", nil)
                          
                                          otherButtonTitles:NSLocalizedString(@"Cancel", nil),nil];
    
    
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    
    alert.delegate = self;
    alert.tag = 100;
    [alert show];
    
    
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 0) {
        // do something here...
        
        UIStoryboard *    storyboardobj=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        //this is object of second class
        UserViewController *ObjUserViewController = [storyboardobj instantiateViewControllerWithIdentifier:@"UserViewController"];

        ObjUserViewController.UserName= [alertView textFieldAtIndex:0].text;
        ObjUserViewController.Password=[alertView textFieldAtIndex:1].text;
        [self.navigationController pushViewController:ObjUserViewController animated:YES];
    }
}
@end

