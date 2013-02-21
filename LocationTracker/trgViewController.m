//
//  trgViewController.m
//  LocationTracker
//
//  Created by Teddy Guenin on 2/18/13.
//  Copyright (c) 2013 Teddy Guenin. All rights reserved.
//

#import "trgViewController.h"

@interface trgViewController ()
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;
@property(assign, nonatomic) CLLocationDistance distanceFilter;
@property(assign, nonatomic) CLLocationAccuracy desiredAccuracy;
@end

@implementation trgViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    [self.locationManager setDistanceFilter:1000];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    if(![self.locationManager locationServicesEnabled]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enable Location Services?" message:@"This app only works with location services enabled." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        // optional - add more buttons:
        [alert addButtonWithTitle:@"Settings"];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self.locationManager stopUpdatingLocation];
    // Dispose of any resources that can be recreated.
}

- (void)enteredBackground {
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    self.currentLocation = location;
    [self addPinToMapAtLocation:location];
    
}


- (void)addPinToMapAtLocation:(CLLocation *)location {
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = location.coordinate;
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.05;
    span.longitudeDelta = 0.05;
    region.span = span;
    region.center = pin.coordinate;
    
    pin.title = [NSString stringWithFormat:@"Lat:%f, Long:%f", self.currentLocation.coordinate.latitude, self.currentLocation.coordinate.longitude];
    [self.mapBG addAnnotation:pin];
    [self.mapBG setRegion:region animated:TRUE];
    [self.mapBG regionThatFits:region];
}

@end
































