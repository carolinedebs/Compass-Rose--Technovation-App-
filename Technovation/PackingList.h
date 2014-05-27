//
//  PackingList.h
//  Technovation
//
//  Created by Caroline Amy Debs on 3/9/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPackingItem.h"
#import "NewItem.h"

@interface PackingList : UITableViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;
@property NSMutableArray *toDoItems;


@end
