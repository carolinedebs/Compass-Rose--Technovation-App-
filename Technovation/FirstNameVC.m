//
//  FirstNameVC.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/3/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "SignUpVC.h"
#import "FirstNameVC.h"

@interface FirstNameVC ()
@property (weak, nonatomic) IBOutlet UITextField *TextField;
@end

@implementation FirstNameVC


-(IBAction)removeKeyboard{
    [self.TextField resignFirstResponder];}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.selectedFirstName = self.TextField.text;
}

- (void)viewDidLoad
{
    [super viewDidLoad]; }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; }

@end
