//
//  ViewController.m
//  Convetor(Temprature)
//
//  Created by Bhumesh on 15/05/15.
//  Copyright (c) 2015 Com.Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]]];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back.jpg"]];
    bgImageView.frame = self.view.bounds;
    [self.view addSubview:bgImageView];
    [self.view sendSubviewToBack:bgImageView];
    _btnConvert.layer.borderWidth=1.0f;
    _btnConvert.layer.cornerRadius=10;
    _btnConvert.layer.backgroundColor=[UIColor grayColor].CGColor;
    _text.layer.borderWidth=1.0f;
    _text.layer.cornerRadius=10;
    _Disp.layer.borderWidth=1.0f;
    _Disp.layer.cornerRadius=15;
    _Disp.layer.backgroundColor=[UIColor clearColor].CGColor;

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (IBAction)convert:(id)sender {
//    double ferhrenhit=[_tex.text doubleValue];
//    double cels=(ferhrenhit-32)/1.8;
//    NSString *res=[[NSString alloc] initWithFormat:@"Celcious %f",cels];
//    _Result.text=res;
//}
- (IBAction)conv:(id)sender {
    double fahrenheit=[_text.text doubleValue];
    double res=(fahrenheit -32)/1.8;
    NSString *dis=[[NSString alloc]initWithFormat:@"Result= %f",res];
    _Disp.text=dis;
    
}
@end
