////
////  DropDifferentTypes.m
////  Compass Rose
////
////  Created by Caroline Amy Debs on 4/1/14.
////  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
////
//
//#import "DropDifferentTypes.h"
//#import "Home.h"
//
//@interface DropDifferentTypes ()
//
//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *address;
//@property (nonatomic, assign) CLLocationCoordinate2D theCoordinate;
//@property (weak, nonatomic) IBOutlet MKMapView *mapView;
//@property (nonatomic, strong) NSMutableArray *Coordinates;
//
//@end
//
//@implementation DropDifferentTypes
//{
//    CLLocation *_location;
//    NSString *annotation;
//    CLLocation *yourAnnotationLocation;
//    CLLocationManager *locationManager;
//}
//@synthesize mapView;
//
//-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
//{
//    float heightImage = 30.00;
//    float widthImage = 20.00;
//    
//    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
//    
//    if ([annotation.title isEqual: @"Police"]) {
//        annotationView.image = [UIImage imageNamed:@"RedPin.png"];
//    }
//    else if ([annotation.title isEqual: @"Hospital"]){
//        annotationView.image = [UIImage imageNamed:@"GreenPin.png"];
//    }
//    else if ([annotation.title isEqual: @"Drugstore"]){
//        annotationView.image = [UIImage imageNamed:@"map-pin-purple-hi.png"];
//    }
//    else if ([annotation.title isEqual: @"Tourist Attraction"]){
//        annotationView.image = [UIImage imageNamed:@"BluePin.png"]; }
//    
//    CGRect resizeRect;
//    resizeRect.size.height = heightImage;
//    resizeRect.size.width = widthImage;
//    resizeRect.origin = (CGPoint){0.0f, 0.0f};
//    UIGraphicsBeginImageContext(resizeRect.size);
//    [annotationView.image drawInRect:resizeRect];
//    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    annotationView.image = resizedImage;
//    [annotationView setEnabled:YES];
//    [annotationView setCanShowCallout:YES];
//    return annotationView;
//    
//}
//
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    NSString *Drugstores = [[NSUserDefaults standardUserDefaults] stringForKey:@"Drugstores"];
//    NSLog(@"Drugstores %@", Drugstores);
//    
//    locationManager = [[CLLocationManager alloc] init];
//    locationManager.distanceFilter = kCLDistanceFilterNone;
//    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
//    [locationManager startUpdatingLocation];
//    
//    CLLocationCoordinate2D currentlocation;
//    currentlocation.latitude = locationManager.location.coordinate.latitude;
//    currentlocation.longitude = locationManager.location.coordinate.longitude;
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(currentlocation, 10000, 10000);
//    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
//    
//    self.mapView.delegate = self;
//    
//    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"Coordinates" ofType:@"plist"];
//    self.Coordinates = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
//    
//    NSString *Hospital = [[NSUserDefaults standardUserDefaults] stringForKey:@"Hospital"];
//    NSString *Police = [[NSUserDefaults standardUserDefaults] stringForKey:@"Police"];
//    NSString *Unsafe = [[NSUserDefaults standardUserDefaults] stringForKey:@"Unsafe"];
//    NSString *Drugstore = [[NSUserDefaults standardUserDefaults] stringForKey:@"Drugstores"];
//    
//    NSUInteger numel = [self.Coordinates count];
//    NSLog(@"%lu", (unsigned long)numel);
//    
//    while (numel > 0) {
//        
//        NSString *Type = [[self.Coordinates objectAtIndex:(numel-1)] valueForKey:@"Type"];
//        NSLog(@"%@", Type);
//        
//        CLLocationCoordinate2D point;
//        
//        NSString *Longitude = [[self.Coordinates objectAtIndex:(numel-1)] valueForKey:@"Longitude"];
//        double Longitude1 = [Longitude doubleValue];
//        
//        NSString *Latitude = [[self.Coordinates objectAtIndex:(numel-1)] valueForKey:@"Latitude"];
//        double Latitude1 = [Latitude doubleValue];
//        
//        point.longitude = Latitude1;
//        point.latitude = Longitude1;
//        
//        NSLog(@"%f %f", Longitude1, Latitude1);
//        
//        if ([Hospital isEqualToString:@"Yes"] && [Type isEqualToString:@"Hospital"]){
//            DropDifferentTypes *annotation1 = [[DropDifferentTypes alloc] initWithCoordinate:point title:Type];
//            [self.mapView addAnnotation:(id)annotation1];
//        }
//        
//        if ([Police isEqualToString:@"Yes"] && [Type isEqualToString:@"Police"]){
//            DropDifferentTypes *annotation1 = [[DropDifferentTypes alloc] initWithCoordinate:point title:Type];
//            [self.mapView addAnnotation:(id)annotation1];
//        }
//        
//        if ([Unsafe isEqualToString:@"Yes"] && [Type isEqualToString:@"Unsafe"]){
//            DropDifferentTypes *annotation1 = [[DropDifferentTypes alloc] initWithCoordinate:point title:Type];
//            [self.mapView addAnnotation:(id)annotation1];
//        }
//        
//        if ([Drugstore isEqualToString:@"Yes"] && [Type isEqualToString:@"Drugstores"]){
//            DropDifferentTypes *annotation1 = [[DropDifferentTypes alloc] initWithCoordinate:point title:Type];
//            [self.mapView addAnnotation:(id)annotation1];
//        }
//        
//        numel = numel - 1;
//        
//    }
//
//    
//}
//
//
//
//@end
