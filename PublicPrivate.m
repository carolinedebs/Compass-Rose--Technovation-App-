//
//  PublicPrivate.m
//  Compass Rose
//
//  Created by Caroline Amy Debs on 4/3/14.
//  Copyright (c) 2014 Caroline Amy Debs. All rights reserved.
//

#import "PublicPrivate.h"

@interface PublicPrivate ()
@property (weak, nonatomic) IBOutlet UISwitch *Switch;
@property (weak, nonatomic) IBOutlet UISwitch *Private;

@end

@implementation PublicPrivate

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if (self.Switch.on){
        self.PublicPrivate = @"Public";

    }
    if (self.Private.on){
        self.PublicPrivate = @"Private";
    }

}


- (IBAction)InfoMaps:(id)sender {
    
    NSString *title = @"";
    
    NSString *message = [NSString stringWithFormat:@"If you wish to make your pin public to the Compass Rose community, select the 'Public' option. Else, please select the 'Private' option."];
    
    UIAlertView *alertView =
    [[UIAlertView alloc]
     initWithTitle:title
     message:message
     delegate:self
     cancelButtonTitle:@"OK"
     otherButtonTitles:nil];
    
    [alertView show];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
