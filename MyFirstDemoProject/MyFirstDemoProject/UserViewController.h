//
//  UserViewController.h
//  MyFirstDemoProject
//
//  Created by Bhumesh on 16/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *testView;
@property (retain,nonatomic)  NSString *Name;
@property (strong, nonatomic) IBOutlet UILabel *lblname;
@end
