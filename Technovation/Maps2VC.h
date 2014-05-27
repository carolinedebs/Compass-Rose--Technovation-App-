//
//  Maps2VC.h
//  Technovation
//
//  Created by Caroline Amy Debs on 3/6/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>

@interface Maps2VC : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title;
- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;
- (MKMapItem*)mapItem;

@end
