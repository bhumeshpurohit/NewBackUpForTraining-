//
//  ViewController.m
//  mapviewmultipin
//
//  Created by Bhumesh on 22/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CLLocationManager *locationManager;
    NSMutableArray *Locations;
    NSMutableArray *arryFollowData;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapview.delegate = self;
    arryFollowData=[[NSMutableArray alloc]init];
    NSDictionary  *d1=[NSDictionary dictionaryWithObjectsAndKeys:@"19.12",@"latitude",@"73.58",@"longitude",@"Junur",@"name",nil];
    NSDictionary  *d2=[NSDictionary dictionaryWithObjectsAndKeys:@"18.31",@"latitude",@"73.55",@"longitude",@"Pune",@"name",nil];
    NSDictionary  *d3=[NSDictionary dictionaryWithObjectsAndKeys:@"18.51",@"latitude",@"73.56",@"longitude",@"Khed",@"name",nil];
    NSDictionary  *d4=[NSDictionary dictionaryWithObjectsAndKeys:@"19.14",@"latitude",@"73.10",@"longitude",@"Kalyan",@"name",nil];
    NSDictionary  *d5=[NSDictionary dictionaryWithObjectsAndKeys:@"18.44",@"latitude",@"73.28",@"longitude",@"Lonavala",@"name",nil];
    [arryFollowData addObject:d1];
    [arryFollowData addObject:d2];
    [arryFollowData addObject:d3];
    [arryFollowData addObject:d4];
    [arryFollowData addObject:d5];
  // [self showAnnotation:1];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)showAnnotation:(int )pin
{
    [self removeAllPinsButUserLocation];
    CLLocationCoordinate2D annotationCoord;
    [self.mapview reloadInputViews];
    int i;
    for (i=0;i<pin;i++)
    {
        NSDictionary *d = arryFollowData[i];
        float latitude=[[d valueForKey:@"latitude"] floatValue];
        float longitude=[[d valueForKey:@"longitude"] floatValue];
        NSString *name=[d valueForKey:@"name"];
        annotationCoord.latitude = latitude;
        annotationCoord.longitude = longitude;
        
        
        
        MKPointAnnotation *annotationPoint2 = [[MKPointAnnotation alloc] init];
        annotationPoint2.coordinate = annotationCoord;
        annotationPoint2.title = name;
      
        [self.mapview addAnnotation:annotationPoint2 ];
        
        
    }
    
    UIScrollView
    MKCoordinateSpan span = MKCoordinateSpanMake(3, 3);
    MKCoordinateRegion myregion;
    myregion.center=annotationCoord;
    myregion.span=span;
    [self.mapview setRegion:[self.mapview regionThatFits:myregion] animated:YES];
    
}
//- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation: (id<MKAnnotation>) annotation {
//    MKPinAnnotationView *pin = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier: @"annotation_ID"];
//    if (pin == nil) {
//        pin = [[MKPinAnnotationView alloc] initWithAnnotation: annotation reuseIdentifier: @"annotation_ID"];
//    } else {
//        pin.annotation = annotation;
//    }
//    pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//   // pin.pinColor = MKPinAnnotationColorPurple;
//    pin.animatesDrop = YES;
//    [pin setEnabled:YES];
//    [pin setCanShowCallout:YES];
//    //pin.image=[UIImage imageNamed:@"flag.png"];
//    return pin;
//}
- (void)removeAllPinsButUserLocation
{
    id userLocation = [self.mapview userLocation];
    NSMutableArray *pins = [[NSMutableArray alloc] initWithArray:[self.mapview annotations]];
    if ( userLocation != nil ) {
        [pins removeObject:userLocation]; // avoid removing user location off the map
    }
    
    [self.mapview removeAnnotations:pins];
  
    pins = nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (IBAction)B1prees:(id)sender {
    [self showAnnotation:1];
}

- (IBAction)B2Press:(id)sender {
    [self showAnnotation:2];
}

- (IBAction)B3Press:(id)sender {
    [self showAnnotation:3];
}

- (IBAction)B4Press:(id)sender {
    [self showAnnotation:4];
}

- (IBAction)B5Press:(id)sender {
    [self showAnnotation:5];
}

- (IBAction)Remove:(id)sender {
    [self removeAllPinsButUserLocation];
}
@end
