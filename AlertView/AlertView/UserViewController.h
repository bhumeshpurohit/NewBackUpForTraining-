//
//  UserViewController.h
//  AlertView
//
//  Created by Bhumesh on 05/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController
@property (nonatomic, strong) UserViewController *UserName;
@property (nonatomic, strong) UserViewController *Password;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *pass;




@end
