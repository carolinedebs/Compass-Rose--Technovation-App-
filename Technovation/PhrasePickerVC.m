//
//  PhrasePickerVC.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/5/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "PhrasePickerVC.h"

@interface PhrasePickerVC ()
@property (weak, nonatomic) IBOutlet UILabel *word;
@property (weak, nonatomic) IBOutlet UILabel *Spoken;
@property (weak, nonatomic) IBOutlet UILabel *Translation;
@property (weak, nonatomic) IBOutlet UIPickerView *PhrasePicker;

@end

@implementation PhrasePickerVC


- (NSArray *)TranslationArray{
    return @[@"l'hôtel",
             @"l'hôpital",
             @"la plage",
             @"l'aéroport",
             @"la banque",
             @"commissariat de police",
             @"station de bus",
             @"pharmacie",
             @"embassade"];
}

- (NSArray *)SpokenArray{
    return @[@"low-tell",
             @"low-pea-tahl",
             @"lah plah-sheh",
             @"lare-oh-pour",
             @"lah bahn-kh",
             @"com-misery duh pol-ez",
             @"stassion de boos",
             @"farmacee",
             @"embassahd"];
}

- (void)viewDidLoad{
    [super viewDidLoad];
	arrStatus = [[NSArray alloc] initWithObjects: @"hotel", @"hospital", @"beach", @"airport", @"bank", @"police station", @"bus station", @"drugstore", @"embassy", nil];
    self.word.text = arrStatus[0];
    self.Translation.text = self.TranslationArray[0];
    self.Spoken.text = self.SpokenArray[0];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.word.text = arrStatus[row];
    self.Translation.text = self.TranslationArray[row];
    self.Spoken.text = self.SpokenArray[row];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    //One column
    return 1; }


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return arrStatus.count; }

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    return [arrStatus objectAtIndex:row]; }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
