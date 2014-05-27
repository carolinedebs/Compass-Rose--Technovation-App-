//
//  NewItem.h
//  Technovation
//
//  Created by Caroline Amy Debs on 3/9/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
