//
//  CityPickerViewController.h
//  Technovation
//
//  Created by Caroline Amy Debs on 2/28/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "FirstVC.h"
#import <UIKit/UIKit.h>

@interface CityPickerVC : UIViewController<UIPageViewControllerDataSource, UIPickerViewDelegate> {
    UIPickerView *CityPicker;
    NSArray *arrStatus;}

@property (nonatomic, strong) NSString *selectedName;

@property (weak, nonatomic) IBOutlet UIPickerView *CityPicker;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;

@end
