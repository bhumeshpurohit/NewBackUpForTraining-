//
//  Anotation.h
//  GoogleMap
//
//  Created by Bhumesh on 22/06/15.
//  Copyright (c) 2015 Zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface Anotation : UIViewController <MKAnnotation>
@property (nonatomic,assign) CLLocationCoordinate2D cordinate;
@property (nonatomic,copy) NSString *latitude;
@property (nonatomic,copy) NSString *longitude;
@end
