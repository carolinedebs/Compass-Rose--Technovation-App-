//
//  MapsVC.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/5/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "MapsVC.h"

@interface MapsVC ()

@property (weak, nonatomic) IBOutlet UIButton *GetLocationButton;
@property (weak, nonatomic) IBOutlet UILabel *LocationLabel;
@end

@implementation MapsVC{
CLLocationManager *_locationManager;
CLLocation *_location;
BOOL _updatingLocation;
NSError *_lastLocationError;
CLGeocoder *_geocoder;
CLPlacemark *_placemark;
BOOL _performingReverseGeocoding;
NSError *_lastGeocodingError;}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateLabels];
    [self configureGetButton];
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        _locationManager = [[CLLocationManager alloc] init];
        _geocoder = [[CLGeocoder alloc] init];
    }
    return self; }


- (IBAction)getLocation:(id)sender {
    if (_updatingLocation) {
        [self stopLocationManager]; }
    else {
        _location = nil;
        _lastLocationError = nil;
        _placemark = nil;
        _lastGeocodingError = nil;
        
        [self startLocationManager]; }
    
    [self updateLabels];
    [self configureGetButton];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError %@", error);
    if (error.code == kCLErrorLocationUnknown) {
        return; }
    
    [self stopLocationManager];
    _lastLocationError = error;
    
    [self updateLabels];
    [self configureGetButton];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations lastObject];
    NSLog(@"didUpdateLocations %@", newLocation);
    if ([newLocation.timestamp timeIntervalSinceNow] < -5.0) {
        return; }
    if (newLocation.horizontalAccuracy < 0) {
        return; }
    
    CLLocationDistance distance = MAXFLOAT;
    if (_location != nil) {
        distance = [newLocation distanceFromLocation:_location];
    }
    
    if (_location == nil || _location.horizontalAccuracy > newLocation.horizontalAccuracy) {
        _lastLocationError = nil;
        _location = newLocation;
        [self updateLabels];
        if (newLocation.horizontalAccuracy <= _locationManager.desiredAccuracy) {
            NSLog(@"*** We're done!");
            [self stopLocationManager];
            [self configureGetButton];
            
            if (distance > 0){
                _performingReverseGeocoding = NO;
            }
        }
        if (!_performingReverseGeocoding) {
            NSLog(@"*** Going to geocode");
            _performingReverseGeocoding = YES;
            [_geocoder reverseGeocodeLocation:_location completionHandler:^(NSArray *placemarks, NSError *error) {
                NSLog(@"*** Found placemarks: %@, error: %@", placemarks, error);
                _lastGeocodingError = error;
                if (error == nil && [placemarks count] > 0) {
                    _placemark = [placemarks lastObject];}
                else {
                    _placemark = nil;}
                _performingReverseGeocoding = NO;
                [self updateLabels];
            }];
        }
    }
    else if (distance < 1.0) {
        NSTimeInterval timeInterval = [newLocation.timestamp timeIntervalSinceDate:_location.timestamp];
        if (timeInterval > 10) {
            NSLog(@"*** Force done!");
            [self stopLocationManager];
            [self updateLabels];
            [self configureGetButton]; }
    }
}

- (NSString *)stringFromPlacemark:(CLPlacemark *)thePlacemark{
    if (thePlacemark.subThoroughfare != nil) {

        NSString *placemark1 = [NSString stringWithFormat:@"%@ %@\n%@, %@, %@", thePlacemark.subThoroughfare, thePlacemark.thoroughfare,thePlacemark.locality,thePlacemark.administrativeArea, thePlacemark.postalCode];
        [[NSUserDefaults standardUserDefaults]setObject:placemark1 forKey:@"placemark1"];
        return placemark1;
    }

    else {
        
        NSString *placemark1 = [NSString stringWithFormat:@"%@\n%@, %@, %@", thePlacemark.thoroughfare,thePlacemark.locality,thePlacemark.administrativeArea, thePlacemark.postalCode];
        [[NSUserDefaults standardUserDefaults]setObject:placemark1 forKey:@"placemark1"];
        return placemark1;
    
    }}


- (void)updateLabels {
    
    if (_location != nil) {

        if (_placemark != nil) {
            self.LocationLabel.text = [self stringFromPlacemark: _placemark];}
        else if (_performingReverseGeocoding) {
            self.LocationLabel.text = @"Searching For Address ...";}
        else if (_lastGeocodingError != nil) {
            self.LocationLabel.text = @"Error Finding Address ...";}
        else {
            self.LocationLabel.text = @"No Adress Found.";}
    }
    
    else {
        self.LocationLabel.text = @"";
    } }

- (void)configureGetButton {
    if (_updatingLocation) {
        [self.GetLocationButton setTitle:@"Stop" forState:UIControlStateNormal];}
    else {
        [self.GetLocationButton setTitle:@"Find My Location" forState:UIControlStateNormal];}
}

- (void)startLocationManager {
    if ([CLLocationManager locationServicesEnabled]) {
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        [_locationManager startUpdatingLocation];
        _updatingLocation = YES;
        [self performSelector:@selector(didTimeOut:)withObject:nil afterDelay:60]; }
}

- (void)stopLocationManager {
    if (_updatingLocation) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(didTimeOut:) object:nil];
        [_locationManager stopUpdatingLocation];
        _locationManager.delegate = nil;
        _updatingLocation = NO;
    } }


- (void)didTimeOut:(id)obj {
    NSLog(@"*** Time out");
    if (_location == nil) {
        [self stopLocationManager];
        _lastLocationError = [NSError errorWithDomain: @"MyLocationsErrorDomain" code:1 userInfo:nil];
        [self updateLabels];
        [self configureGetButton]; }
}


@end
