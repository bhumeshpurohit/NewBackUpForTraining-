//
//  ViewController.h
//  UIProgressViewExample
//
//  Created by Bhumesh on 15/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
- (IBAction)startProgress:(id)sender;
- (IBAction)startReset:(id)sender;
@property (nonatomic) float progressValue;



@end

