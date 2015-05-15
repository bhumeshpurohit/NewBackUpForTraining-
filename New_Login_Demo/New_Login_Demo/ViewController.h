//
//  ViewController.h
//  New_Login_Demo
//
//  Created by Bhumesh on 01/05/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *Name;
@property (strong, nonatomic) IBOutlet UILabel *Title;
@property (strong, nonatomic) IBOutlet UITextField *Password;

- (IBAction)Click:(id)sender;

@end

