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

static NSString *HUMAN = @"X";
static NSString *COMPUTER = @"O";

@implementation ViewController
@synthesize gameFinished, button, currentPlayer, availableButtons, sortedButtons, asc, gameStatus, rematch;

- (IBAction)makeMove:(id)sender
{
    if ( self.gameFinished == NO )
    {
        button = (UIButton*) sender;
        button.enabled = NO;
        buttonTitle = [button currentTitle];
        
        [button setTitle:self.currentPlayer forState:UIControlStateNormal];
        
        if ( [ self gameOverOnButton:button] == NO )
        {
            if ( self.currentPlayer == HUMAN )
            {
                self.currentPlayer = COMPUTER;
                [ self makeRandomComputerMove ];
            }
            else
            {
                self.currentPlayer = HUMAN;
            }
        }
    }
}

- (void)makeRandomComputerMove
{
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
    
    if ( availableButtonCount == 0 )
    {
        self.gameFinished = YES;
        
        NSString *status = [[NSString alloc] initWithFormat:@"It's a tie!"];
        
        gameStatus.text = status;
        rematch.hidden = NO;
        
        [ status release ];
    }
    else
    {
        int randIndex = random() % availableButtonCount--;
        
        UIButton * aibutton = (UIButton*)[availableButtons objectAtIndex:(randIndex)];
        [availableButtons removeAllObjects];
        [self makeMove:aibutton];
    }
}

- (BOOL)gameOverOnButton:(UIButton *)pressedButton
{
    int tag = pressedButton.tag;
    
    int col = tag % 3;
    int row = (tag - col) / 3;
    
    int rowCount = 0;
    int colCount = 0;
    int diagonalCount1 = 0;
    int diagonalCount2 = 0;
    
    for( i = 0; i < 3; i++ )
    {
        if ( ((UIButton*)[sortedButtons objectAtIndex:(row*3+i)]).currentTitle == self.currentPlayer )
        {
            rowCount++;
        }
        if ( ((UIButton*)[sortedButtons objectAtIndex:(i*3+col)]).currentTitle == self.currentPlayer )
        {
            colCount++;
        }
        if ( ((UIButton*)[sortedButtons objectAtIndex:(i*3+i)]).currentTitle == self.currentPlayer )
        {
            diagonalCount1++;
        }
        if ( ((UIButton*)[sortedButtons objectAtIndex:(i*3+2-i)]).currentTitle == self.currentPlayer )
        {
            diagonalCount2++;
        }
    }
    
    if( rowCount == 3 || colCount == 3 || diagonalCount1 == 3 || diagonalCount2 == 3 )
    {
        self.gameFinished = YES;
        
        NSString *status = [[NSString alloc] initWithFormat:@"%@ has won", self.currentPlayer];
        
        gameStatus.text = status;
        rematch.hidden = NO;
        
        [ status release ];
    }
    
    return self.gameFinished;
}

- (IBAction)resetBoard:(id)sender
{
    for ( button in sortedButtons )
    {
        button.enabled = YES;
        [ button setTitle:nil forState:UIControlStateNormal ];
    }
    
    NSString *status = [[NSString alloc] initWithString:@"I play to win!"];
    gameStatus.text = status;
    
    self.currentPlayer = HUMAN;
    self.gameFinished = NO;
    rematch.hidden = YES;
    
    [ status release ];
}

- (void)viewDidLoad
{
    srandomdev();
    self.currentPlayer = HUMAN;
    self.gameFinished = NO;
    
    self.asc = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
    self.sortedButtons = [self.buttons sortedArrayUsingDescriptors:@[self.asc]];
    self.availableButtons = [[NSMutableArray alloc] init];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)dealloc
{
    [ asc release ];
    [ sortedButtons release ];
    [ availableButtons release ];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
