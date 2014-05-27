//
//  DropPinVC.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/7/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//


#import <CoreLocation/CoreLocation.h>
#import "DropPinVC.h"
#import "Maps2VC.h"
#import "MapsVC.h"
#import "TypeLocation.h"
#import "W2AppDelegate.h"

@interface DropPinVC ()

@property (weak, nonatomic) IBOutlet UILabel *LocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *RatingLabel;
@property (weak, nonatomic) IBOutlet UIButton *UpdateButton;
@property (weak, nonatomic) IBOutlet UITextField *Descript;
@property (weak, nonatomic) IBOutlet UIButton *GetLocationButton;
@property (weak, nonatomic) IBOutlet UILabel *PublicLabel;


@end

@implementation DropPinVC{
    
    CLLocationManager *_locationManager;
    CLLocation *_location;
    BOOL _updatingLocation;
    NSError *_lastLocationError;
    CLGeocoder *_geocoder;
    CLPlacemark *_placemark;
    BOOL _performingReverseGeocoding;
    NSError *_lastGeocodingError;
    
}


- (IBAction)Public:(UIStoryboardSegue *)segue{
    PublicPrivate *viewController = segue.sourceViewController;
    self.PublicLabel.text = viewController.PublicPrivate;
}

- (IBAction)TypeWritten:(UIStoryboardSegue *)segue{
    TypeLocation *viewController = segue.sourceViewController;
    self.TypeLabel.text = viewController.TypeLocation; }


- (IBAction)RatingWritten:(UIStoryboardSegue *)segue{
    RateLocation *viewController = segue.sourceViewController;
    self.RatingLabel.text = viewController.RatingL; }

-(IBAction)removeKeyboard{
    [self.Descript resignFirstResponder];}


- (IBAction)done:(id)sender {
    
    NSString *valueToSave = @"Yes";
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"Dropped Pin"];
    
//    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
//                            stringForKey:@"Dropped Pin"];
//    
//    NSLog(@"Saved Value %@", savedValue);
    
    [self closeScreen];
}

- (IBAction)cancel:(id)sender {
    [self closeScreen]; }

- (void)closeScreen {
    [self dismissViewControllerAnimated:YES completion:nil]; }


- (void)viewDidLoad
{
//    NSString *TypeLocation = [[NSUserDefaults standardUserDefaults] stringForKey:@"Type Location"];
    self.LocationLabel.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"placemark1"];
    
    self.RatingLabel.text = nil;
    self.TypeLabel.text = nil;
    self.PublicLabel.text = nil;
    
    NSString *TypeLocation = nil;
    [[NSUserDefaults standardUserDefaults] setObject:TypeLocation forKey:@"Type Location"];
    
    NSString *RateLocation = nil;
    [[NSUserDefaults standardUserDefaults] setObject:RateLocation forKey:@"Rate Location"];
    
    [super viewDidLoad];
}


- (IBAction)updateRating:(id)sender {
    
    NSString *updatedLabel = [[NSUserDefaults standardUserDefaults] stringForKey:@"Type Location"];
    NSLog(@"Updated Label = %@", updatedLabel);
    self.TypeLabel.text = updatedLabel;
    
    NSString *updatedLabel2 = [[NSUserDefaults standardUserDefaults] stringForKey:@"Rate Location"];
    NSLog(@"Updated Label = %@", updatedLabel2);
    self.RatingLabel.text = updatedLabel2;
    
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning]; }

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
        [self.GetLocationButton setTitle:@"Update" forState:UIControlStateNormal];}
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
