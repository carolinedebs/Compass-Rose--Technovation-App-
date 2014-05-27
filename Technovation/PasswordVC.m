//
//  PasswordVC.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/4/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "PasswordVC.h"

@interface PasswordVC ()

@property (weak, nonatomic) IBOutlet UITextField *PasswordText;

@end

@implementation PasswordVC

-(IBAction)removeKeyboard{
    [self.PasswordText resignFirstResponder]; }

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.selectedPassword = self.PasswordText.text;
    NSString *valueToSave = self.PasswordText.text;
    [[NSUserDefaults standardUserDefaults]
     setObject:valueToSave forKey:@"New Password"];
}

- (void)viewDidLoad
{
    [super viewDidLoad]; }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; }

@end
