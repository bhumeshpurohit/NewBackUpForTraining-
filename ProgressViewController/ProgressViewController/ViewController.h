//
//  ViewController.h
//  ProgressViewController
//
//  Created by Bhumesh on 13/05/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    IBOutlet UIActivityIndicatorView *	myActivityView;
}
@property (nonatomic, retain) IBOutlet
UIActivityIndicatorView *myActivityView;


- (IBAction)doit:(id)sender;


@end

