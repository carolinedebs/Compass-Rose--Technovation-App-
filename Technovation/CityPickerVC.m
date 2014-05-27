//
//  CityPickerViewController.m
//  Technovation
//
//  Created by Caroline Amy Debs on 2/28/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "FirstVC.h"
#import "CityPickerVC.h"

@interface CityPickerVC ()

@property (weak, nonatomic) IBOutlet UIButton *GoButton;

@end

@implementation CityPickerVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	arrStatus = [[NSArray alloc] initWithObjects: @"Paris", @"San Francisco", @"Shanghai", @"New York", @"London", @"Tokyo", @"Sydney", nil];
    //self.CityLabel.text = arrStatus[0];
    self.NameLabel.text =  [[NSUserDefaults standardUserDefaults] stringForKey:@"Username"];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    //self.CityLabel.text = arrStatus[row];
    
    if (arrStatus[row] == arrStatus[0]){
        self.GoButton.enabled = YES;
    }
    else{
        self.GoButton.enabled = NO;
        NSString *title = @"Sorry!";
        
        NSString *message = [NSString stringWithFormat:@"Our apologies. Compass Rose is not available for this city yet."];
        
        UIAlertView *alertView =
        [[UIAlertView alloc]
         initWithTitle:title
         message:message
         delegate:self
         cancelButtonTitle:@"OK"
         otherButtonTitles:nil];
        
        [alertView show];
    }
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    //One column
    return 1; }


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return arrStatus.count; }

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    return [arrStatus objectAtIndex:row]; }


@end
