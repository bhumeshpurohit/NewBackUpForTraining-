//
//  ViewController.h
//  mapdemo
//
//  Created by Bhumesh on 23/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreLocation/CoreLocation.h"
#import "MapKit/MapKit.h"
@interface ViewController : UIViewController  <MKMapViewDelegate,MKAnnotation>
@property (strong, nonatomic) IBOutlet MKMapView *mapview;

@end

