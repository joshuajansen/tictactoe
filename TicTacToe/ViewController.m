//
//  ViewController.m
//  TicTacToe
//
//  Created by Joshua Jansen on 12-09-12.
//  Copyright (c) 2012 Joshua Jansen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize button, currentPlayer;

- (IBAction)makeMove:(id)sender
{
    NSLog(@"Title: %i", currentPlayer);
    if( currentPlayer == 0 || currentPlayer == 1 )
    {
        
        [sender setTitle:@"X" forState:UIControlStateNormal];
        currentPlayer = 2;
        NSLog(@"Title: %i", currentPlayer);
    }
    
    if( currentPlayer == 2)
    {
        [sender setTitle:@"O" forState:UIControlStateNormal];
        currentPlayer = 1;
    }
//    NSString *newContent = [[NSString alloc] initWithFormat:@"X"];
//    boxContent.text = newContent;
//    [newContent release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) dealloc
{
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
