//
//  TranslationsVC.m
//  Technovation
//
//  Created by Caroline Amy Debs on 3/7/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "TranslationsVC.h"
#import "PhrasePickerVC.h"

@interface TranslationsVC ()

@property (nonatomic, strong) NSMutableArray *Translations;
@property (weak, nonatomic) IBOutlet UIButton *Backward;
@property (weak, nonatomic) IBOutlet UIButton *Forwards;
@property (weak, nonatomic) IBOutlet UITextField *PageNumber;
@property (weak, nonatomic) IBOutlet UILabel *English;
@property (weak, nonatomic) IBOutlet UILabel *French;
@property (weak, nonatomic) IBOutlet UILabel *Spoken;
@property (weak, nonatomic) IBOutlet UITextField *SearchBar;

@property (strong, nonatomic) IBOutlet UISegmentedControl *SegCont;

@end

@implementation TranslationsVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//- (IBAction)SegChange:(id)sender {
//    
//    if (self.SegCont.selectedSegmentIndex == 0){
//        NSLog(@"Case 0");
//    }
//    if (self.SegCont.selectedSegmentIndex == 1){
//        NSLog(@"Case 1");
//    }
//
//}
//    if (self.SegCont.selectedSegmentIndex == 1) {
//
//        PhrasePickerVC *vc = [[PhrasePickerVC alloc] initWithNibName: @"MediaView" bundle:nil];
//        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//        [self presentModalViewController: vc animated: YES];
//        
//    }
//    if (self.SegCont.selectedSegmentIndex == 0) {
//
//        TranslationsVC *vc = [[TranslationsVC alloc] initWithNibName: @"MediaView" bundle:nil];
//        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//        [self presentModalViewController: vc animated: YES];
//        
//    }


-(IBAction)removeKeyboard{
    [self.PageNumber resignFirstResponder];
    [self.SearchBar resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"translations" ofType:@"plist"];
    self.Translations= [NSMutableArray arrayWithContentsOfFile:plistCatPath];
    
    NSString *EnglishText = [[self.Translations objectAtIndex:0] valueForKey:@"English"];
    self.English.text = EnglishText;
    
    NSString *FrenchText = [[self.Translations objectAtIndex:0] valueForKey:@"French"];
    self.French.text = FrenchText;
    
    NSString *SpokenText = [[self.Translations objectAtIndex:0] valueForKey:@"Spoken"];
    self.Spoken.text = SpokenText;
    
    self.SearchBar.text = @"Search";
    
    self.PageNumber.text = [NSString stringWithFormat:@"%ld", (long)1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(IBAction) Back {
    
    NSInteger b = [self.PageNumber.text integerValue];
    if (b>1){
        
        b = b-1;
        
        NSString *EnglishText = [[self.Translations objectAtIndex:(b-1)] valueForKey:@"English"];
        self.English.text = EnglishText;
        
        NSString *FrenchText = [[self.Translations objectAtIndex:(b-1)] valueForKey:@"French"];
        self.French.text = FrenchText;
        
        NSString *SpokenText = [[self.Translations objectAtIndex:(b-1)] valueForKey:@"Spoken"];
        self.Spoken.text = SpokenText;
        
        self.PageNumber.text = [NSString stringWithFormat:@"%ld", (long)b];
        
        self.SearchBar.text = @"Search";
    }
    
}
-(IBAction) Foward {
    
    NSUInteger numel = [self.Translations count];
    NSInteger b = [self.PageNumber.text integerValue];
    
    if (b<numel){
        
        b = b+1;
        
        NSString *EnglishText = [[self.Translations objectAtIndex:(b-1)] valueForKey:@"English"];
        self.English.text = EnglishText;
        
        NSString *FrenchText = [[self.Translations objectAtIndex:(b-1)] valueForKey:@"French"];
        self.French.text = FrenchText;
        
        NSString *SpokenText = [[self.Translations objectAtIndex:(b-1)] valueForKey:@"Spoken"];
        self.Spoken.text = SpokenText;
        self.PageNumber.text = [NSString stringWithFormat:@"%ld", (long)b];
        
        self.SearchBar.text = @"Search";
    }
    
}


-(IBAction) NewPage {
    
    NSInteger b = [self.PageNumber.text integerValue];

    NSString *EnglishText = [[self.Translations objectAtIndex:(b-1)] valueForKey:@"English"];
    self.English.text = EnglishText;

    NSString *FrenchText = [[self.Translations objectAtIndex:(b-1)] valueForKey:@"French"];
   self.French.text = FrenchText;

    NSString *SpokenText = [[self.Translations objectAtIndex:(b-1)] valueForKey:@"Spoken"];
   self.Spoken.text = SpokenText;

    self.SearchBar.text = @"Search";
}

-(IBAction) SearchForPhrase {
    
    NSMutableArray *copyDataSource = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"translations" ofType:@"plist"]];

    NSString *searchFor = self.SearchBar.text;
    
    if ([searchFor length] > 0) {
        
        NSLog(@"Array = %@", copyDataSource);
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"Self.English CONTAINS[c] %@",searchFor];
        [copyDataSource filterUsingPredicate:pred];
        NSLog(@"Filtered Array = %@", copyDataSource);
        NSMutableArray *copiedDataSource = copyDataSource;
    
        
        NSUInteger keyCountForObject = [copiedDataSource count];
        NSLog(@"Length = %lu", keyCountForObject);
        
        if (keyCountForObject > 0){
            
            NSInteger num = [self.Translations indexOfObject:copyDataSource[0]];
            
            NSString *EnglishText = [[self.Translations objectAtIndex:(num)] valueForKey:@"English"];
            self.English.text = EnglishText;
            
            NSString *FrenchText = [[self.Translations objectAtIndex:(num)] valueForKey:@"French"];
            self.French.text = FrenchText;
            
            NSString *SpokenText = [[self.Translations objectAtIndex:(num)] valueForKey:@"Spoken"];
            self.Spoken.text = SpokenText;
            
            self.PageNumber.text = [NSString stringWithFormat:@"%ld", (long)(num+1)];
        }
    
        else{

            self.SearchBar.text = @"Could Not Find Search Item";
        }
    
    }
}


- (IBAction)ClearTextField:(id)sender {
    
    self.SearchBar.text = nil;
    
}


@end
