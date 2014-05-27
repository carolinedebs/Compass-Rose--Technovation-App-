//
//  Location.h
//  Compass Rose
//
//  Created by Caroline Amy Debs on 3/18/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Location : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * locationDescription;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) id placemark;
@property (nonatomic, retain) NSString * category;

@end
