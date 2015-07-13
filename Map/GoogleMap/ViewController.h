//
//  ViewController.h
//  GoogleMap
//
//  Created by Bhumesh on 19/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "Anotation.h"
@interface ViewController : UIViewController<MKMapViewDelegate,MKAnnotation>


@property (strong, nonatomic) IBOutlet MKMapView *mapview;


@end

