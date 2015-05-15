//
//  ViewController.h
//  Convetor(Temprature)
//
//  Created by Bhumesh on 15/05/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *text;
@property (strong, nonatomic) IBOutlet UILabel *Disp;

@property (strong, nonatomic) IBOutlet UIButton *btnConvert;
- (IBAction)conv:(id)sender;


@end

