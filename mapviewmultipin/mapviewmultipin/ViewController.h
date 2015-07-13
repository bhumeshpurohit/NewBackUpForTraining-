//
//  ViewController.h
//  mapviewmultipin
//
//  Created by Bhumesh on 22/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController <MKMapViewDelegate,MKAnnotation>
- (IBAction)B1prees:(id)sender;
- (IBAction)B2Press:(id)sender;

- (IBAction)B3Press:(id)sender;
- (IBAction)B4Press:(id)sender;
- (IBAction)B5Press:(id)sender;
- (IBAction)Remove:(id)sender;



@property (strong, nonatomic) IBOutlet MKMapView *mapview;
@end

