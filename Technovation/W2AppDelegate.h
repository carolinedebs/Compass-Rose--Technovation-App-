//
//  W2AppDelegate.h
//  Technovation
//
//  Created by Caroline Amy Debs on 2/28/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface W2AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//@property (nonatomic, strong) NSManagedObjectContext
//*managedObjectContext; @property (nonatomic, strong) NSManagedObjectModel
//*managedObjectModel; @property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator ;

@end
