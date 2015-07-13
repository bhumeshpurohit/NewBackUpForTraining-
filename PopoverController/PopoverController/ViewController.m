//
//  ViewController.m
//  PopoverController
//
//  Created by Bhumesh on 10/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () 
- (IBAction)Popup:(id)sender;
@property (nonatomic, strong) UIPopoverController *userDataPopover;
@end

@implementation ViewController
{
    NSArray *arrAgeRanges;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    arrAgeRanges = [[NSArray alloc] initWithObjects:@"< 18", @"18 - 25", @"25 - 30", @"30 - 35", @"35 - 40", @">= 40", nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma - IBAction method implementation
- (IBAction)Popup:(id)sender {
    
    [self.delegate userDataChangedWithUsername:self.txtName.text
                                   andAgeRange:[arrAgeRanges objectAtIndex:[self.pickerAge selectedRowInComponent:0]]
                                     andGender:[self.segGender titleForSegmentAtIndex:self.segGender.selectedSegmentIndex]];
}
@end
