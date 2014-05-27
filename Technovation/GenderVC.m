//
//  GenderVC.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/4/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "SignUpVC.h"
#import "GenderVC.h"

@interface GenderVC ()

@property (weak, nonatomic) IBOutlet UISwitch *GenderSwitch;
@property (weak, nonatomic) IBOutlet UILabel *YesLabel;
@property (weak, nonatomic) IBOutlet UILabel *NoLabel;

@end

@implementation GenderVC

-(IBAction) switchValueChanged
{
    if (self.GenderSwitch.on){
        self.YesLabel.text = @"Yes";
    }
    else{
        self.NoLabel.text = @"No";}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (self.GenderSwitch.on){
        self.selectedGender = @"Yes";
    }
    else{
        self.selectedGender = @"No";} }

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.NoLabel.text = @"No";
    self.YesLabel.text = @"Yes";}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; }

@end
