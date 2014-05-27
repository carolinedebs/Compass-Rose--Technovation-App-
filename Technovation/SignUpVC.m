//
//  SignUpVC.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/3/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "SignUpVC.h"
#import "FirstNameVC.h"
#import "LastNameVC.h"
#import "UsernameVC.h"
#import "PasswordVC.h"
#import "AgeVC.h"
#import "GenderVC.h"

@interface SignUpVC ()
@property (weak, nonatomic) IBOutlet UILabel *GenderLabel;
@property (weak, nonatomic) IBOutlet UILabel *AgeLabel;
@property (weak, nonatomic) IBOutlet UILabel *PasswordLabel;
@property (weak, nonatomic) IBOutlet UILabel *UsernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *FirstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *LastNameLabel;
@end

@implementation SignUpVC

- (IBAction)done:(id)sender {
    [self closeScreen];}

- (IBAction)cancel:(id)sender {
    [self closeScreen]; }

- (void)closeScreen {
    [self dismissViewControllerAnimated:YES completion:nil]; }

- (IBAction)FirstNameWritten:(UIStoryboardSegue *)segue{
    FirstNameVC *viewController = segue.sourceViewController;
    self.FirstNameLabel.text = viewController.selectedFirstName; }

- (IBAction)LastNameWritten:(UIStoryboardSegue *)segue{
    LastNameVC *viewController = segue.sourceViewController;
    self.LastNameLabel.text = viewController.selectedLastName; }

- (IBAction)UserNameWritten:(UIStoryboardSegue *)segue{
    UsernameVC *viewController = segue.sourceViewController;
    self.UsernameLabel.text = viewController.selectedUsername; }


- (IBAction)PasswordWritten:(UIStoryboardSegue *)segue{
    PasswordVC *viewController = segue.sourceViewController;
    self.PasswordLabel.text = viewController.selectedPassword; }

- (IBAction)AgeWritten:(UIStoryboardSegue *)segue{
    AgeVC *viewController = segue.sourceViewController;
    self.AgeLabel.text = viewController.selectedAge; }

- (IBAction)GenderWritten:(UIStoryboardSegue *)segue{
    GenderVC *viewController = segue.sourceViewController;
    self.GenderLabel.text = viewController.selectedGender; }


- (void)viewDidLoad {
    [super viewDidLoad];
    self.FirstNameLabel.text = nil;
    self.LastNameLabel.text = nil;
    self.UsernameLabel.text = nil;
    self.PasswordLabel.text = nil;
    self.AgeLabel.text = nil;
    self.GenderLabel.text = nil;

}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning]; }

@end
