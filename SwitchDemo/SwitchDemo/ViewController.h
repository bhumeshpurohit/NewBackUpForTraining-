//
//  ViewController.h
//  SwitchDemo
//
//  Created by Bhumesh on 12/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)OnOffSwitch:(id)sender;
@property IBOutlet UISwitch *onOffSwitch;
@property IBOutlet UILabel *onOffLabel;
@property (strong, nonatomic) IBOutlet UIView *mainview;

@end

