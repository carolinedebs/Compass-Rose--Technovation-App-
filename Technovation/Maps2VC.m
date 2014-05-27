//
//  Maps2VC.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/6/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#define METERS_PER_MILE 160000.344
#import "Maps2VC.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>
#import "TypeLocation.h"

@interface Maps2VC ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) CLLocationCoordinate2D theCoordinate;
@property (nonatomic, strong) NSMutableArray *Coordinates;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation Maps2VC{
    CLLocation *_location;
    NSString *annotation;
    CLLocation *yourAnnotationLocation;
    CLLocationManager *locationManager;
    CLLocationManager *_locationManager;
    BOOL _updatingLocation;
    NSError *_lastLocationError;
    CLGeocoder *_geocoder;
    CLPlacemark *_placemark;
    BOOL _performingReverseGeocoding;
    NSError *_lastGeocodingError;
}
@synthesize mapView;


-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    float heightImage = 40.00;
    float widthImage = 27.00;
    
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
    
    if ([annotation.title isEqual: @"Police"]) {
        annotationView.image = [UIImage imageNamed:@"RedPin.png"];
    }
    else if ([annotation.title isEqual: @"Hospital"]){
        annotationView.image = [UIImage imageNamed:@"GreenPin.png"];
    }
    else if ([annotation.title isEqual: @"Drugstore"]){
        annotationView.image = [UIImage imageNamed:@"map-pin-purple-hi.png"];
    }
    else if ([annotation.title isEqual: @"Transportation"]){
        annotationView.image = [UIImage imageNamed:@"BluePin.png"];
    }
//    else{
//        annotationView.image = [UIImage imageNamed:@"BluePin.png"];
//    }
    
    CGRect resizeRect;
    resizeRect.size.height = heightImage;
    resizeRect.size.width = widthImage;

    resizeRect.origin = (CGPoint){0.0f, 0.0f};
    UIGraphicsBeginImageContext(resizeRect.size);
    [annotationView.image drawInRect:resizeRect];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    annotationView.image = resizedImage;
    [annotationView setEnabled:YES];
    [annotationView setCanShowCallout:YES];
    return annotationView;
    
}


-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title {
    if ((self = [super init])) {
        self.coordinate = coordinate;
        self.title = title;
    }
    return self;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
    CLLocationCoordinate2D currentlocation;
    currentlocation.latitude = _location.coordinate.latitude;
    currentlocation.longitude = _location.coordinate.longitude;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 10000, 10000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 48.858248;
    zoomLocation.longitude= 2.294690;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *Drugstores = [[NSUserDefaults standardUserDefaults] stringForKey:@"Drugstores"];
    NSLog(@"Drugstores %@", Drugstores);
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager startUpdatingLocation];
    
    self.mapView.delegate = self;
    
    CLLocationCoordinate2D currentlocation;
    currentlocation.latitude = locationManager.location.coordinate.latitude;
    currentlocation.longitude = locationManager.location.coordinate.longitude;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(currentlocation, 10000, 10000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"Coordinates" ofType:@"plist"];
    self.Coordinates = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
    
    NSUInteger numel = [self.Coordinates count];
    NSLog(@"Number of Coordinates: %lu", (unsigned long)numel);
    
//    NSString *valueToSave = @"No";
//    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"Dropped Pin"];
    [self CheckDroppedPin];
    
    while (numel > 0) {
        
        NSString *Type = [[self.Coordinates objectAtIndex:(numel-1)] valueForKey:@"Type"];

        CLLocationCoordinate2D point;
        
        NSString *Longitude = [[self.Coordinates objectAtIndex:(numel-1)] valueForKey:@"Longitude"];
        double Longitude1 = [Longitude doubleValue];
        
        NSString *Latitude = [[self.Coordinates objectAtIndex:(numel-1)] valueForKey:@"Latitude"];
        double Latitude1 = [Latitude doubleValue];
        
        point.longitude = Latitude1;
        point.latitude = Longitude1;
        
//        NSLog(@"%f %f", Longitude1, Latitude1);
        
        if ([Type isEqualToString:@"Trans"]){
            
            NSString *Trans = [[NSUserDefaults standardUserDefaults] stringForKey:@"Trans"];
            Maps2VC *annotation1 = [[Maps2VC alloc] initWithCoordinate:point title:@"Transportation"];
            if ([Trans isEqualToString:@"Yes"] && [Type isEqualToString:@"Trans"]){
                [self.mapView addAnnotation:(id)annotation1];
            }
        }
        
        
        else{
            
            Maps2VC *annotation1 = [[Maps2VC alloc] initWithCoordinate:point title:Type];
        
            NSString *Hospital = [[NSUserDefaults standardUserDefaults] stringForKey:@"Hospital"];
            NSString *Police = [[NSUserDefaults standardUserDefaults] stringForKey:@"Police"];
            NSString *Unsafe = [[NSUserDefaults standardUserDefaults] stringForKey:@"Unsafe"];
            NSString *Drugstore = [[NSUserDefaults standardUserDefaults] stringForKey:@"Drugstores"];
            
        
            if ([Hospital isEqualToString:@"Yes"] && [Type isEqualToString:@"Hospital"]){
                [self.mapView addAnnotation:(id)annotation1];
            }
            if ([Police isEqualToString:@"Yes"] && [Type isEqualToString:@"Police"]){
                [self.mapView addAnnotation:(id)annotation1];
            }
            if ([Unsafe isEqualToString:@"Yes"] && [Type isEqualToString:@"Unsafe"]){
                [self.mapView addAnnotation:(id)annotation1];
            }
            if ([Drugstore isEqualToString:@"Yes"] && [Type isEqualToString:@"Drugstore"]){
                [self.mapView addAnnotation:(id)annotation1];
            }
        }
        
        numel = numel - 1;
        
    }

}

-(void)CheckDroppedPin{
    
    NSString *DroppedPin = [[NSUserDefaults standardUserDefaults]
                       stringForKey:@"Dropped Pin"];
    
    NSLog(@"Dropped Pin %@", DroppedPin);
    
    if ([DroppedPin isEqual: @"Yes"]){
        
        NSString *TypeL = [[NSUserDefaults standardUserDefaults] stringForKey:@"Type Location"];

        NSLog(@"Type Location %@", TypeL);
        
        CLLocationCoordinate2D currentlocation;
        currentlocation.latitude = locationManager.location.coordinate.latitude;
        currentlocation.longitude = locationManager.location.coordinate.longitude;
        
        NSLog(@"Location Latitude %f", currentlocation.latitude);
        Maps2VC *annotation1 = [[Maps2VC alloc] initWithCoordinate:currentlocation title:TypeL];
        [self.mapView addAnnotation:(id)annotation1];
    }
    
    else{
        
        CLLocationCoordinate2D zoomLocation;
        zoomLocation.latitude = 48.858248;
        zoomLocation.longitude= 2.294690;
        Maps2VC *ETower = [[Maps2VC alloc] initWithCoordinate:zoomLocation title:@"The Eiffel Tower"];
        [self.mapView addAnnotation:(id)ETower];
        
    }
    
}

@end