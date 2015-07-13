//
//  ViewController.m
//  PickerViewDemo
//
//  Created by Bhumesh on 15/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *items;
}
@synthesize picker;
- (void)viewDidLoad {
    [super viewDidLoad];
    items=@[@[@"Item1",@"Item2",@"Item3",@"Item4",@"Item5",@"Item6",@"Item7",@"Item8"],
             @[@"1",@"2",@"3",@"4"],
            @[@"Sunday",@"Monday",@"TuesDay",@"Wednesday"],
            @[@"Jan",@"Feb",@"March",@"April"],
            @[@"Jan1",@"Feb1",@"March1",@"April1"]];
    
   // self.picker.dataSource=self;
  //  self.picker.delegate=self;
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}
-(int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
//     NSLog(@"%@",items[component]);
    
    return [[items objectAtIndex:component] count];
    
    
    
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
   
    
    return items[component][row];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
