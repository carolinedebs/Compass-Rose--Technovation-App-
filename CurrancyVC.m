//
//  CurrancyVC.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/6/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "CurrancyVC.h"

@interface CurrancyVC ()
@property (weak, nonatomic) IBOutlet UISwitch *ConversionSlider;
@property (weak, nonatomic) IBOutlet UILabel *EnterAmountLabel1;
@property (weak, nonatomic) IBOutlet UITextField *AmountText1;
@property (weak, nonatomic) IBOutlet UILabel *EnterAmountLabel2;
@property (weak, nonatomic) IBOutlet UILabel *AmountText2;
@end

@implementation CurrancyVC


-(IBAction)removeKeyboard{
    //Connection: DidEndOnExit
    [self.AmountText1 resignFirstResponder];}

-(IBAction) switchValueChanged
{
    if (self.ConversionSlider.on){
        self.EnterAmountLabel1.text = @"Enter € Amount:";
        self.EnterAmountLabel2.text = @"The $ Amount:";
        self.AmountText1.text = nil;
        self.AmountText2.text = nil;
    }
    else{
        self.EnterAmountLabel1.text = @"Enter $ Amount:";
        self.EnterAmountLabel2.text = @"The € Amount:";
        self.AmountText1.text = nil;
        self.AmountText2.text = nil;
    }
}

-(IBAction) DoConversion
{
    if (self.ConversionSlider.on){
        double amount = [self.AmountText1.text doubleValue];
        amount = (0.72 * amount);
        NSString *NewAmount = [NSString stringWithFormat:@"$ %.2f", amount];
        self.AmountText2.text = NewAmount;
        
    }
    else{
        double amount = [self.AmountText1.text doubleValue];
        amount = (1.38 * amount);
        NSString *NewAmount = [NSString stringWithFormat:@"€ %.2f", amount];
        self.AmountText2.text = NewAmount;
    }
}


- (void)viewDidLoad{
    [super viewDidLoad];
    self.AmountText2.text = nil;
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}

@end
