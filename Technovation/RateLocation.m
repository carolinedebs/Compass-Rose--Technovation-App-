//
//  RateLocation.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/8/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "RateLocation.h"
#import "DropPinVC.h"

@interface RateLocation ()

@property (weak, nonatomic) IBOutlet UISlider *Slider;
@property (weak, nonatomic) IBOutlet UIButton *Smile;
@property (weak, nonatomic) IBOutlet UIButton *Meh;
@property (weak, nonatomic) IBOutlet UIButton *Frown;
@property (weak, nonatomic) IBOutlet UILabel *Label;

@end

@implementation RateLocation

int _currentValue;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    _currentValue = lroundf(self.Slider.value);
    
    if (33 < _currentValue && _currentValue< 66){
//        [self.Smile setHidden:YES];
//        [self.Frown setHidden:YES];
//        [self.Meh setHidden:NO];
        NSString *RateLocation = @"Indifferent";
        self.RatingL = RateLocation;
        [[NSUserDefaults standardUserDefaults] setObject:RateLocation forKey:@"Rate Location"];
    }
    else if (-1 < _currentValue && _currentValue< 34){
//        [self.Smile setHidden:YES];
//        [self.Frown setHidden:NO];
//        [self.Meh setHidden:YES];
        NSString *RateLocation = @"Bad";
        self.RatingL = RateLocation;
        [[NSUserDefaults standardUserDefaults] setObject:RateLocation forKey:@"Rate Location"];
    }
    else if (65 < _currentValue && _currentValue< 101){
//        [self.Smile setHidden:NO];
//        [self.Frown setHidden:YES];
//        [self.Meh setHidden:YES];
        NSString *RateLocation = @"Good";
        self.RatingL = RateLocation;
        [[NSUserDefaults standardUserDefaults] setObject:RateLocation forKey:@"Rate Location"];
    }
    
    NSString *str = [NSString stringWithFormat:@"%d", _currentValue];
    self.Label.text = str;
    
    NSString *updatedLabel = [[NSUserDefaults standardUserDefaults] stringForKey:@"Rate Location"];
    
//    NSLog(@"Updated Label = %@", updatedLabel);
    
}

- (IBAction)ChangeFaces:(id)sender {
    
    _currentValue = lroundf(self.Slider.value);
    
    if (33 < _currentValue && _currentValue< 66){
        [self.Smile setHidden:YES];
        [self.Frown setHidden:YES];
        [self.Meh setHidden:NO];
        NSString *RateLocation = @"Indifferent";
        self.RatingL = RateLocation;
        [[NSUserDefaults standardUserDefaults] setObject:RateLocation forKey:@"Rate Location"];
    }
    else if (-1 < _currentValue && _currentValue< 34){
        [self.Smile setHidden:YES];
        [self.Frown setHidden:NO];
        [self.Meh setHidden:YES];
        NSString *RateLocation = @"Bad";
        self.RatingL = RateLocation;
        [[NSUserDefaults standardUserDefaults] setObject:RateLocation forKey:@"Rate Location"];
    }
    else if (65 < _currentValue && _currentValue< 101){
        [self.Smile setHidden:NO];
        [self.Frown setHidden:YES];
        [self.Meh setHidden:YES];
        NSString *RateLocation = @"Good";
        self.RatingL = RateLocation;
        [[NSUserDefaults standardUserDefaults] setObject:RateLocation forKey:@"Rate Location"];
    }
    
    NSString *str = [NSString stringWithFormat:@"%d", _currentValue];
    self.Label.text = str;
    
    NSString *updatedLabel = [[NSUserDefaults standardUserDefaults] stringForKey:@"Rate Location"];
    
//    NSLog(@"Updated Label = %@", updatedLabel);
    
}


- (void)closeScreen {
    [self dismissViewControllerAnimated:YES completion:nil]; }

- (IBAction)cancel:(id)sender {
    
    NSString *RateLocation = nil;
    [[NSUserDefaults standardUserDefaults] setObject:RateLocation forKey:@"Rate Location"];
    
    [self closeScreen];
}

- (IBAction)done:(id)sender {
    [self closeScreen];
}

- (void)viewDidLoad
{
    
    [self.Smile setHidden:YES];
    [self.Frown setHidden:YES];
    [self.Meh setHidden:NO];
    [super viewDidLoad];
    _currentValue = self.Slider.value;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
