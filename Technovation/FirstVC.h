//
//  W2FirstViewController.h
//  Technovation
//
//  Created by Caroline Amy Debs on 2/28/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "CityPickerVC.h"
#import <UIKit/UIKit.h>

@interface FirstVC : UIViewController


@property (nonatomic, strong) NSString *selectedName;

@property (weak, nonatomic) IBOutlet UITextField *UsernameText;
@property (weak, nonatomic) IBOutlet UITextField *PasswordText;
@property (weak, nonatomic) IBOutlet UIButton *Login;
@property (weak, nonatomic) IBOutlet UIButton *SignUp;
@property (nonatomic, strong) NSMutableArray *LogIns;

@end
