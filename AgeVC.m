//
//  AgeVC.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/4/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "AgeVC.h"

@interface AgeVC ()

@end

@implementation AgeVC

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.selectedAge = self.AgeLabel.text;}

- (void)viewDidLoad {
    [super viewDidLoad];
	arrStatus = @[@"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"38", @"39", @"40", @"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50", @"51", @"52", @"53", @"54", @"55", @"56", @"57", @"58", @"59", @"60"];
    self.AgeLabel.text = arrStatus[0];}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.AgeLabel.text = arrStatus[row];
    self.selectedAge = self.AgeLabel.text;}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1; }

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return (arrStatus.count); }

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [arrStatus objectAtIndex:row]; }

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];}

@end
