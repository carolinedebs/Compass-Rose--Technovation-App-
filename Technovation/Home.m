//
//  Home.m
//  Compass Rose
//
//  Created by Caroline Amy Debs on 4/1/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "Home.h"

@interface Home ()
@property (weak, nonatomic) IBOutlet UISwitch *Hospital;
@property (weak, nonatomic) IBOutlet UISwitch *UnsafeLocation;
@property (weak, nonatomic) IBOutlet UISwitch *PoliceStations;
@property (weak, nonatomic) IBOutlet UISwitch *Drugstores;
@property (weak, nonatomic) IBOutlet UISwitch *Trans;

@end

@implementation Home 

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.Hospital.on = NO;
    self.UnsafeLocation.on = NO;
    self.PoliceStations.on = NO;
    self.Drugstores.on = NO;
    [[NSUserDefaults standardUserDefaults] setObject:@"No" forKey:@"Unsafe"];
    [[NSUserDefaults standardUserDefaults] setObject:@"No" forKey:@"Drugstores"];
    [[NSUserDefaults standardUserDefaults] setObject:@"No" forKey:@"Police"];
    [[NSUserDefaults standardUserDefaults] setObject:@"No" forKey:@"Hospital"];
    [[NSUserDefaults standardUserDefaults] setObject:@"No" forKey:@"Trans"];
}

- (IBAction)InfoMaps:(id)sender {
    
    NSString *title = @"Tips";

    NSString *message = [NSString stringWithFormat:@"Press 'Mark Your Location' button to add your own pins. \n \n See pins that other's have added by toggling on different types of locations and then press 'Maps.'"];
    
    UIAlertView *alertView =
    [[UIAlertView alloc]
     initWithTitle:title
     message:message
     delegate:self
     cancelButtonTitle:@"OK"
     otherButtonTitles:nil];
    
    [alertView show];
    
}

- (IBAction)UnsafeChanged:(id)sender {
    
    NSString *UnsafeSwitched = @"No";
    if (self.UnsafeLocation.on){
        UnsafeSwitched = @"Yes";
        [[NSUserDefaults standardUserDefaults] setObject:UnsafeSwitched forKey:@"Unsafe"];
    }
}
- (IBAction)Transportation:(id)sender {
    
    NSString *TransSwitched = @"No";
    if (self.Trans.on){
        TransSwitched = @"Yes";
        [[NSUserDefaults standardUserDefaults] setObject:TransSwitched forKey:@"Trans"];
    }
}

- (IBAction)DrugstoresChanged:(id)sender {
    NSString *DrugstoresSwitched = @"No";
    if (self.Drugstores.on){
        DrugstoresSwitched = @"Yes";
        [[NSUserDefaults standardUserDefaults] setObject:DrugstoresSwitched forKey:@"Drugstores"];
    }
}
- (IBAction)PoliceChanged:(id)sender {
    
    NSString *PoliceSwitched = @"No";
    
    if (self.PoliceStations.on){
        PoliceSwitched = @"Yes";
        [[NSUserDefaults standardUserDefaults] setObject:PoliceSwitched forKey:@"Police"];
    }
}

- (IBAction)HospitalsChanged:(id)sender {
    
    NSString *HospitalSwitched = @"No";
    
    if (self.Hospital.on){
        HospitalSwitched = @"Yes";
        [[NSUserDefaults standardUserDefaults] setObject:HospitalSwitched forKey:@"Hospital"];
    
    }
}



@end
