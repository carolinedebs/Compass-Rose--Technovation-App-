//
//  AgeVC.h
//  Technovation
//
//  Created by Caroline Amy Debs on 3/4/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "SignUpVC.h"
#import <UIKit/UIKit.h>

@interface AgeVC : UIViewController<UIPageViewControllerDataSource, UIPickerViewDelegate> {
    UIPickerView *AgePicker;
    NSArray *arrStatus;}

@property (nonatomic, strong) NSString *selectedAge;

@property (weak, nonatomic) IBOutlet UILabel *AgeLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *AgePicker;

@end
