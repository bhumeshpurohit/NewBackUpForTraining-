//
//  ViewController.h
//  SteperDemo
//
//  Created by Bhumesh on 15/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)valueChange:(id)sender;
@property (strong, nonatomic) IBOutlet UIStepper *steper;
@property (strong, nonatomic) IBOutlet UIView *testview;
@property  IBOutlet CGFloat newheight;
@end

