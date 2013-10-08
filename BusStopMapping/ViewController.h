//
//  ViewController.h
//  BusStopMapping
//
//  Created by John Andrews on 10/8/13.
//  Copyright (c) 2013 John Andrews. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *busRouteMapView;

@end
