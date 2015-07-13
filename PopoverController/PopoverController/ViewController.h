//
//  ViewController.h
//  PopoverController
//
//  Created by Bhumesh on 10/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, strong)  delegate;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@end

