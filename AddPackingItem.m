//
//  AddItem.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/9/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "NewItem.h"
#import "AddPackingItem.h"
#import "PackingList.h"
#import "W2AppDelegate.h"

@interface AddPackingItem ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *DoneButton;

@end

@implementation AddPackingItem

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)removeKeyboard:(id)sender {
    
    [self.textField resignFirstResponder];
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.DoneButton) return;
    
    if (self.textField.text.length > 0) {
        
        self.toDoItem = [[NewItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
        
    }
    
    W2AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSManagedObject *newPackingItem;
    
    newPackingItem = [NSEntityDescription
                  insertNewObjectForEntityForName:@"PackingList"
                  inManagedObjectContext:context];
    
    [newPackingItem setValue: self.toDoItem.itemName forKey:@"newitem"];

    NSError *error;
    [context save:&error];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
