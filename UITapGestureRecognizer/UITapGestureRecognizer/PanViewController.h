//
//  PanViewController.h
//  UITapGestureRecognizer
//
//  Created by Bhumesh on 11/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanViewController : UIViewController
@property (weak,nonatomic) IBOutlet UIView *testView;
@property (strong, nonatomic) IBOutlet UILabel *Xposition;
@property (strong, nonatomic) IBOutlet UILabel *Yposition;


@end
