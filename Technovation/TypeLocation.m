//
//  TypeLocation.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/7/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "TypeLocation.h"

@interface TypeLocation ()

@property (weak, nonatomic) IBOutlet UISwitch *HospitalSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *UnsafeLocationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *DrugstoreSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *PoliceSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *TransSwitch;

@property NSMutableArray *toDoItems;

@end

@implementation TypeLocation
{NSObject *tappedItem;}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)closeScreen {
    [self dismissViewControllerAnimated:YES completion:nil]; }


- (IBAction)cancel:(id)sender {
    
    NSString *TypeLocation = nil;
    [[NSUserDefaults standardUserDefaults] setObject:TypeLocation forKey:@"Type Location"];
    
    [self closeScreen]; }



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    
    if (self.HospitalSwitch.on){
        self.TypeLocation = @"Hospital";
        [[NSUserDefaults standardUserDefaults] setObject:self.TypeLocation forKey:@"Type Location"];
    }
    else if (self.UnsafeLocationSwitch.on){
        self.TypeLocation = @"Unsafe Location";
        [[NSUserDefaults standardUserDefaults] setObject:self.TypeLocation forKey:@"Type Location"];
    }
    else if (self.DrugstoreSwitch.on){
        self.TypeLocation = @"Drugstore";
        [[NSUserDefaults standardUserDefaults] setObject:self.TypeLocation forKey:@"Type Location"];
    }
    else if (self.PoliceSwitch.on){
        self.TypeLocation = @"Police";
        [[NSUserDefaults standardUserDefaults] setObject:self.TypeLocation forKey:@"Type Location"];
    }
    else if (self.TransSwitch.on){
        self.TypeLocation = @"Transportation";
        [[NSUserDefaults standardUserDefaults] setObject:self.TypeLocation forKey:@"Type Location"];
    }
    else{
        self.TypeLocation = @"No Location Type Saved";
        [[NSUserDefaults standardUserDefaults] setObject:self.TypeLocation forKey:@"Type Location"];
    }

}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
