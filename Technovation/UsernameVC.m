//
//  UsernameVC.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/4/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "SignUpVC.h"
#import "UsernameVC.h"

@interface UsernameVC ()
@property (weak, nonatomic) IBOutlet UITextField *UsernameText;

@end

@implementation UsernameVC


-(IBAction)removeKeyboard{
    [self.UsernameText resignFirstResponder]; }


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.selectedUsername = self.UsernameText.text;
    NSString *valueToSave = self.UsernameText.text;
    [[NSUserDefaults standardUserDefaults]
     setObject:valueToSave forKey:@"New Username"];
//
//    NSInteger countValue = [self.UserNameArray count];
//    NSLog(@"%ld", (long)countValue);
//    [self.UserNameArray addObject:valueToSave];
//    
//    NSLog(@"%@", valueToSave);
//    NSLog(@"%@", self.UserNameArray);
}

- (void)viewDidLoad
{
    [super viewDidLoad]; }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; }

@end
