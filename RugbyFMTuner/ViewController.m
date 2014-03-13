//
//  ViewController.m
//  RugbyFMTuner
//
//  Created by Colum on 09/03/2014.
//  Copyright (c) 2014 Colúm Bennett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *display;

- (IBAction)buttonPressed:(id)sender;

@end

@implementation ViewController {
    
    // global vars
    BOOL start;
    NSTimeInterval time;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.display.text = @"0:00";
    start = false;
}

- (void) update {
    
    // do nothing if false
    if(start == false) {
        return;
    }
    
    // returns current time
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval elapsedTime = currentTime - time;
    
    // casting double to integar
    int minutes = (int)(elapsedTime / 60.0);
    
    int seconds = (int)(elapsedTime = elapsedTime - (minutes * 60)); // get minutes
    
    //update display UI item
    self.display.text = [NSString stringWithFormat:@"%u:%02u", minutes, seconds];
    
    // set fn to to call itself multple times   
    [self performSelector:@selector(update) withObject:self afterDelay:0.1];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {

    if(start == false) {
        
        // set to true to begin timer
        start = true;
        
        time = [NSDate timeIntervalSinceReferenceDate];
        
        // Change button title once timer starts
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        
        // call update fn
        [self update];
        
    } else {
        
        // Stop timer
        start = false;
        
        // if running and rename btn
        [sender setTitle:@"Start" forState:UIControlStateNormal];
    
    }
}
@end
