//
//  ViewController.h
//  ImagePicker
//
//  Created by Bhumesh on 15/05/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (IBAction)Upload:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageview;

@end

