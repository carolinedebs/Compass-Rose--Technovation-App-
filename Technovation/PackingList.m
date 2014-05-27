//
//  PackingList.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/9/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "PackingList.h"
#import "NewItem.h"
#import "W2AppDelegate.h"

@interface PackingList ()

@property (nonatomic, strong) NSMutableArray *PackingItems;

@end

@implementation PackingList
{
    NSArray *items;
    NSMutableArray *selectedItems;
}


- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    AddPackingItem *source = [segue sourceViewController];
    NewItem *item = source.toDoItem;
    if (item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadInitialData {
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"PackingItems" ofType:@"plist"];
    self.PackingItems = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
    
    NSUInteger numel = [self.PackingItems count];
    
    while (numel>0){
        
        NSString *ItemText = [[self.PackingItems objectAtIndex:(numel-1)] valueForKey:@"Item"];
        NewItem *item1 = [[NewItem alloc] init];
        item1.itemName = ItemText;
        [self.toDoItems addObject:item1];
        
        numel = numel - 1;
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NewItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NewItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
