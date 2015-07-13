//
//  ViewController.m
//  Location_UserDefine
//
//  Created by Bhumesh on 18/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()
{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    double Longi;
    double Lati;
}

@end

@implementation ViewController
@synthesize longitude,latitude;
@synthesize address;
- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager=[[CLLocationManager alloc]init];
    geocoder=[[CLGeocoder alloc]init];
    [self.latitude.delegate self];
    [self.longitude.delegate self];
//    Longi=_longitude.text;
//    Lati=_latitude.text;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"sdfsdf");
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self.latitude resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getlocation:(id)sender {
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    [locationManager requestAlwaysAuthorization];
   
    
    Longi=[self.longitude.text doubleValue];
    Lati=[self.longitude.text doubleValue];

    
    //NSLog(@"did updateLocation %@",[locations lastObject]);
    
    CLLocation *LocationAtual = [[CLLocation alloc] initWithLatitude:Longi longitude:Lati];
    
    [geocoder reverseGeocodeLocation:LocationAtual completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            address.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                            placemark.subThoroughfare, placemark.thoroughfare,
                            placemark.postalCode, placemark.locality,
                            placemark.administrativeArea,
                            placemark.country];
        } else
        {
            UIAlertView *errorAlert = [[UIAlertView alloc]
                                       initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [errorAlert show];

        }
    } ];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    

    
}
@end
