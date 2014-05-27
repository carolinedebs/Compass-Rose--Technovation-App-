//
//  PhrasePickerVC.h
//  Technovation
//
//  Created by Caroline Amy Debs on 3/5/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhrasePickerVC : UIViewController <UIPageViewControllerDataSource, UIPickerViewDelegate> {
    UIPickerView *PhrasePicker;
    NSArray *arrStatus;}

@end
