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
@synthesize button, currentPlayer, availableButtons, sortedButtons, asc;

- (IBAction)makeMove:(id)sender
{
    button = (UIButton*) sender;
    buttonTitle = [button currentTitle];
    NSLog(@"Current player before: %i", self.currentPlayer);
    
    if( self.currentPlayer == 1 )
    {
        [button setTitle:@"X" forState:UIControlStateNormal];
        self.currentPlayer = 2;
        [ self makeAIMove ];
    }
    else if( self.currentPlayer == 2 )
    {
        NSLog(@"AImove");
        [button setTitle:@"O" forState:UIControlStateNormal];
        self.currentPlayer = 1;
    }
    NSLog(@"Current player: %i", self.currentPlayer);
    
    button.enabled = NO;
}

- (void)makeAIMove
{
    self.asc = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
    self.sortedButtons = [self.buttons sortedArrayUsingDescriptors:@[asc]];
    self.availableButtons = [[NSMutableArray alloc] init];
    
    for( i = 0; i <= 8; i++ )
    {
        buttonAtIndex = [sortedButtons objectAtIndex:(i)];
        if( buttonAtIndex.currentTitle == nil )
        {
            [availableButtons addObject:buttonAtIndex];
        }
        buttonAtIndex = nil;
    }
    
    int availableButtonCount = [availableButtons count];
    int indexding = random() % availableButtonCount--;

    UIButton * aibutton = (UIButton*)[availableButtons objectAtIndex:(indexding)];
    [self makeMove:aibutton];
}

- (void)viewDidLoad
{
    srandomdev();
    self.currentPlayer = 1;
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
    [ asc release ];
    [ sortedButtons release ];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
