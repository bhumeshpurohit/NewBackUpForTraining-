//
//  ViewController.h
//  SliderDemo
//
//  Created by Bhumesh on 12/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)SliderValueChange:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblValue;
@property (strong, nonatomic) IBOutlet UISlider *slider;


@end

