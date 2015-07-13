//
//  ViewController.m
//  TaskByAadilForAge
//
//  Created by Bhumesh on 18/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIDatePicker *dtpicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initV];
    
}
-(void)initV
{
    self.dtpicker.maximumDate=[NSDate date];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findAge:(id)sender {
    NSDate* birthday = self.dtpicker.date;
    
    NSDate* now = [NSDate date];
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitYear
                                       fromDate:birthday
                                       toDate:now
                                       options:0];
    NSInteger age = [ageComponents year];
    self.lblage.text=[@(age) stringValue] ;
    if(age<18)
    {
        UIAlertView *altview=[[UIAlertView alloc]initWithTitle:@"Age " message:@"Your age is below 18" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        [altview show];
        
    }
    
}
@end
