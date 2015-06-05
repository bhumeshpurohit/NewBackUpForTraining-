//
//  ViewController.h
//  taskdemo
//
//  Created by Bhumesh on 25/05/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
@interface aViewController : UIViewController
{
    SecondViewController *objSecondViewController;
}


- (IBAction)submit:(id)sender;

- (IBAction)selecting:(id)sender;
@property (nonatomic, retain) NSString *title1;
@property (nonatomic, retain) NSString *desc1;
@property (nonatomic,retain)SecondViewController *objSecondViewController;


@property (strong, nonatomic) IBOutlet UIImageView *imageview;
@property (strong, nonatomic) IBOutlet UITextField *titledata;
@property (strong, nonatomic) IBOutlet UITextView *descrip;



@end

