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
    int currentPlayer, i;
    UIButton *button, *buttonAtIndex;
    NSString *buttonTitle;
    NSSortDescriptor *asc;
    NSArray *sortedButtons;
    NSMutableArray *availableButtons;
}
@property int currentPlayer;
@property (nonatomic, retain) NSMutableArray * availableButtons;
@property (nonatomic, retain) NSArray * sortedButtons;
@property (nonatomic, retain) NSSortDescriptor * asc;
@property (nonatomic, retain) IBOutlet UIButton *button;
@property (nonatomic, retain) IBOutletCollection(UIButton) NSArray *buttons;
- (IBAction)makeMove:(id)sender;
@end
