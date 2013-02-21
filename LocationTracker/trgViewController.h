//
//  trgViewController.h
//  LocationTracker
//
//  Created by Teddy Guenin on 2/18/13.
//  Copyright (c) 2013 Teddy Guenin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface trgViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapBG;
@property (strong, nonatomic) UIAlertView *locationPopUp;

@end
