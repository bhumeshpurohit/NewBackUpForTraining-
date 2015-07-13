//
//  ViewController.h
//  JSONDemo
//
//  Created by Bhumesh on 24/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtCountry;

@property (weak, nonatomic) IBOutlet UITableView *tblCountryDetails;

@property (weak, nonatomic) IBOutlet UILabel *lblCountry;

@end

