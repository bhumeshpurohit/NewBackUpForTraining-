//
//  MapViewAnnotation.m
//  BarFly
//
//  Created by Bhavya on 8/9/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "MapViewAnnotation.h"

@implementation MapViewAnnotation

@synthesize title, coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d {
	title = ttl;
	coordinate = c2d;
	return self;
}



@end