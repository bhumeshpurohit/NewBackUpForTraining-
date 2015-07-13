//
//  ViewController.m
//  taskdemo
//
//  Created by Bhumesh on 25/05/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "aViewController.h"
#import "SecondViewController.h"


@interface aViewController ()

@end

@implementation aViewController
@synthesize titledata;
@synthesize descrip;
@synthesize title1;
@synthesize desc1;
@synthesize objSecondViewController;
@synthesize txtview;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
	

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    
    
    
    self.title1=titledata.text;
    self.desc1=descrip.text;
    
    NSLog(@"%@", self.title1);
    
    UIStoryboard *    storyboardobj=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
   //this is object of second class
    objSecondViewController = [storyboardobj instantiateViewControllerWithIdentifier:@"SecondViewController"];
 
    //pass text and image.
    objSecondViewController.titleStr=titledata.text;
    objSecondViewController.img=self.imageview.image;
    objSecondViewController.desc=descrip.text;
 
   // txtview.layer.borderColor =
    
    
    [self.navigationController pushViewController:objSecondViewController animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
   self.imageview.image = chosenImage;
    CALayer * layer = [self.imageview layer];
    [layer setMasksToBounds:YES];
    
    //for round image....
    
   self.imageview.layer.cornerRadius =10.0f;
   self.imageview.layer.borderColor = [[UIColor blackColor] CGColor];
   self.imageview.layer.borderWidth =.4f;
   self.imageview.layer.masksToBounds = YES;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (IBAction)selecting:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}
@end
