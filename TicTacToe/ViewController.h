//
//  ViewController.h
//  TicTacToe
//
//  Created by Joshua Jansen on 12-09-12.
//  Copyright (c) 2012 Joshua Jansen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int i;
    BOOL gameFinished;
    UIButton *button, *buttonAtIndex, *rematch;
    UILabel *gameStatus;
    NSString *currentPlayer, *buttonTitle;
    NSSortDescriptor *asc;
    NSArray *sortedButtons;
    NSMutableArray *availableButtons;
}

@property int i;
@property BOOL gameFinished;
@property (nonatomic, retain) NSString * currentPlayer;
@property (nonatomic, retain) NSMutableArray * availableButtons;
@property (nonatomic, retain) NSArray * sortedButtons;
@property (nonatomic, retain) NSSortDescriptor * asc;
@property (nonatomic, retain) IBOutlet UIButton *button;
@property (nonatomic, retain) IBOutlet UIButton *rematch;
@property (nonatomic, retain) IBOutletCollection(UIButton) NSArray *buttons;
@property (nonatomic, retain) IBOutlet UILabel *gameStatus;

- (IBAction)makeMove:(id)sender;
- (void)makeRandomComputerMove;
- (BOOL)gameOverOnButton:(UIButton *)pressedButton;
- (IBAction)resetBoard:(id)sender;

@end
