//
//  DropPinVC.h
//  Technovation
//
//  Created by Caroline Amy Debs on 3/7/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import "RateLocation.h"
#import "PublicPrivate.h"

@interface DropPinVC : UITableViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) NSString *TypeLocation;
@property (nonatomic,strong) NSString *PublicPrivate;
@property (weak, nonatomic) IBOutlet UILabel *TypeLabel;
@property (nonatomic, strong) NSString *RateLocation;

@property (nonatomic, assign)CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) CLPlacemark *placemark;
@property (nonatomic, strong) NSString *placemark1;


@end
