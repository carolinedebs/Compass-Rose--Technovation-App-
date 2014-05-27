//
//  MapsVC.h
//  Technovation
//
//  Created by Caroline Amy Debs on 3/5/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface MapsVC : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, assign)CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) CLPlacemark *placemark;
@property (nonatomic, strong) NSString *placemark1;

@end
