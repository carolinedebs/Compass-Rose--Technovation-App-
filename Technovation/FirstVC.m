//
//  W2FirstViewController.m
//  Technovation
//
//  Created by Caroline Amy Debs on 2/28/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "CityPickerVC.h"
#import "FirstVC.h"

@interface FirstVC ()

@property (weak, nonatomic) IBOutlet UILabel *CoverLabel;
@property (weak, nonatomic) IBOutlet UILabel *HintHint;
@property (weak, nonatomic) IBOutlet UIImageView *BubbleBubble;

@end

@implementation FirstVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(IBAction)removeKeyboard
{
    //Connection: DidEndOnExit
    [self.UsernameText resignFirstResponder];
    [self.PasswordText resignFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.selectedName = self.UsernameText.text;
}

-(IBAction) NewPage {
    
    NSString *valueToSave = self.UsernameText.text;
    [[NSUserDefaults standardUserDefaults]
     setObject:valueToSave forKey:@"Username"];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *valueToSave = @"No";
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"Dropped Pin"];
    
    self.UsernameText.autocorrectionType = UITextAutocorrectionTypeNo;
    self.PasswordText.autocorrectionType = UITextAutocorrectionTypeNo;
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"LogIn" ofType:@"plist"];
    self.LogIns= [NSMutableArray arrayWithContentsOfFile:plistCatPath];
    
    self.Login.enabled = NO;
    [self.HintHint setHidden: YES];
    [self.BubbleBubble setHidden: YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)LogInPressed:(id)sender {
    
    NSMutableArray *copyDataSource = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LogIn" ofType:@"plist"]];
    [self.HintHint setHidden: YES];
    [self.BubbleBubble setHidden: YES];
    
    NSString *searchFor = self.UsernameText.text;
    
    if ([searchFor length] > 0) {
        
        
        NSString *NewUsername = [[NSUserDefaults standardUserDefaults]
                                 stringForKey:@"New Username"];
        NSString *NewPassword = [[NSUserDefaults standardUserDefaults]
                                 stringForKey:@"New Password"];
        
        //NSLog(@"Array = %@", copyDataSource);
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"Self.username CONTAINS[c] %@",searchFor];
        [copyDataSource filterUsingPredicate:pred];
        //NSLog(@"Filtered Array = %@", copyDataSource);
        NSMutableArray *copiedDataSource = copyDataSource;
        
        
        NSUInteger keyCountForObject = [copiedDataSource count];
        //NSLog(@"Length = %lu", keyCountForObject);
        
        if (keyCountForObject > 0){
            
            NSInteger num = [self.LogIns indexOfObject:copyDataSource[0]];
            
            if (self.PasswordText.text > 0){
                
                NSString *RealPassword = [[self.LogIns objectAtIndex:(num)] valueForKey:@"password"];
                
                if ([RealPassword isEqualToString: self.PasswordText.text]){
                    
                    //[self.CoverLabel setHidden:YES];
                    self.Login.enabled = YES;
                    
                }
            }
        }
        
        else if ([self.UsernameText.text isEqualToString: NewUsername]){
            
            if ([self.PasswordText.text isEqualToString: NewPassword]){
                
                //[self.CoverLabel setHidden:YES];
                self.Login.enabled = YES;
                
            }
            
        }
        else {
            
            //[self.CoverLabel setHidden:NO];
            self.Login.enabled = NO;
        }

    }
}

- (IBAction)ClearTextField2:(id)sender {
    
    self.PasswordText.text = nil;
    [self.HintHint setHidden: NO];
    [self.BubbleBubble setHidden: NO];
    
    
}

- (IBAction)ClearTextField:(id)sender {
    
    self.UsernameText.text = nil;
    
    
}

@end