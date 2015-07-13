//
//  ViewController.h
//  Location_UserDefine
//
//  Created by Bhumesh on 18/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *longitude;
@property (strong, nonatomic) IBOutlet UITextField *latitude;
- (IBAction)getlocation:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *address;


@end

