//
//  ViewController.m
//  GoogleMap
//
//  Created by Bhumesh on 19/06/15.
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
@synthesize mapview;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapview.delegate = self;
//    Locations=[[NSMutableArray alloc]init];
//    
//    locationManager = [[CLLocationManager alloc] init];
//    locationManager.delegate = self;
//    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
//        [locationManager requestAlwaysAuthorization];
//    }
//    [locationManager startUpdatingLocation];
    
    
  arryFollowData=[[NSMutableArray alloc]init];
    NSDictionary  *d1=[NSDictionary dictionaryWithObjectsAndKeys:@"48.139401",@"latitude",@"11.578109",@"longitude",@"Loaction1",@"name",nil];
    NSDictionary  *d2=[NSDictionary dictionaryWithObjectsAndKeys:@"48.138199",@"latitude",@"11.574783",@"longitude",@"Location2",@"name",nil];
    [arryFollowData addObject:d1];
    [arryFollowData addObject:d2];
    //[self showAnnotation];
    [self drawline];
}
- (void)showAnnotation
{
    
    CLLocationCoordinate2D annotationCoord;
    for (NSDictionary *d in arryFollowData)
    {
        float latitude3=[[d valueForKey:@"latitude"] floatValue];
        float longitude3=[[d valueForKey:@"longitude"] floatValue];
        NSString *name=[d valueForKey:@"name"];
        annotationCoord.latitude = latitude3;
        annotationCoord.longitude = longitude3;
        
        MKPointAnnotation *annotationPoint2 = [[MKPointAnnotation alloc] init];
        annotationPoint2.coordinate = annotationCoord;
        annotationPoint2.title = name;
        
        [self.mapview addAnnotation:annotationPoint2];
        
    }
    MKCoordinateSpan span = MKCoordinateSpanMake(0.10, 0.10);
    MKCoordinateRegion myregion;
    myregion.center=annotationCoord;
    myregion.span=span;
    [self.mapview setRegion:[self.mapview regionThatFits:myregion] animated:YES];
    
}

-(void) drawline
{
    MKPlacemark *source = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(37.776142, -122.424774) addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil] ];
    
    MKMapItem *srcMapItem = [[MKMapItem alloc]initWithPlacemark:source];
    [srcMapItem setName:@""];
    
    MKPlacemark *destination = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(37.73787, -122.373962) addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil] ];
    
    MKMapItem *distMapItem = [[MKMapItem alloc]initWithPlacemark:destination];
    [distMapItem setName:@""];
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc]init];
    [request setSource:srcMapItem];
    [request setDestination:distMapItem];
    [request setTransportType:MKDirectionsTransportTypeWalking];
    
    MKDirections *direction = [[MKDirections alloc]initWithRequest:request];
    
}

- (void)mapViewWillStartLocatingUser:(MKMapView *)mapView
{
    
}

    // Do any additional setup after loading the view, typically from a nib.


//- (void)mapViewWillStartLocatingUser:(MKMapView *)mapView
//{
//    
//    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"12.981902,80.266333",@"12.982902,80.266363", nil];
//    
//    CLLocationCoordinate2D pointsToUse[5];
//    
//    for (int i = 0; i < 2; i++)
//    {
//        pointsToUse[i] = CLLocationCoordinate2DMake([[[[array objectAtIndex:0]  componentsSeparatedByString:@","] objectAtIndex:0] floatValue],[[[[array objectAtIndex:0]  componentsSeparatedByString:@","] objectAtIndex:1] floatValue]);
//        
//        [array removeObjectAtIndex:0];
//        
//        GMSMarker *marker = [[GMSMarker alloc] init];
//        marker.animated=YES;
//        marker.position = CLLocationCoordinate2DMake(latitude,longitude);
//        marker.title = @"name";
//        marker.snippet = @"snippet";
//        marker.map = mapView_;    }
//
//}


/*temp
{
    CLLocationCoordinate2D coord  = CLLocationCoordinate2DMake(25.25, 76.70);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    MKCoordinateRegion region = {coord, span};
    
    
    //=  MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 10000, 10000);
    
 /* this code use for only display position that we pass latitude and longitude


    
    MKCoordinateRegion myregion;
    myregion.center=coord;
    myregion.span=span;
    [self.mapview setRegion:[self.mapview regionThatFits:region] animated:YES];
    
    CLLocationCoordinate2D cordinate;
    cordinate.latitude=25.25;
    cordinate.longitude=76.70;
    
    Anotation *myann;
    myann=[[Anotation alloc]init];
    myann.cordinate=coord;
    myann.title=@"Baroda";
    //  myann.subtitle = @"This is Baroda";
    
    [Locations addObject:myann];
    //
    //    cordinate.latitude=21.10;
    //    cordinate.longitude=71.45;
    //
    //
    //    myann=[[Anotation alloc]init];
    //    myann.cordinate=coord;
    //    myann.title=@"Mahuva";
    //    [Locations addObject:myann];
    
    [self.mapview addAnnotations:Locations];
    
    
    
    
    
    
    
    
    //    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    //    point.coordinate = coord; //userLocation.coordinate;
    //    point.title = @"Where am I?";
    //    point.subtitle = @"I'm here!!!";
    //    [mapView selectAnnotation:point animated:YES];
    //[self.mapview addAnnotation:point];

 }*/



//- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
//{
//    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(23.0300, 72.5800);
//    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
//    MKCoordinateRegion region = {coord, span};
//    
//    
//    //=  MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 10000, 10000);
//    
//    /* this code use for only display position that we pass latitude and longitude
//     
//     
//     MKCoordinateRegion myregion;
//     myregion.center=coord;
//     myregion.span=span;
//     [self.mapview setRegion:[self.mapview regionThatFits:region] animated:YES];
//     
//     */
//    
//    
//    
//    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
//    point.coordinate = coord; //userLocation.coordinate;
//    point.title = @"Where am I?";
//    point.subtitle = @"I'm here!!!";
//    
//    [self.mapview addAnnotation:point];
//    
///*^^^^ this code pinout on position that we have pass in lati and longi ^^^^*/
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
