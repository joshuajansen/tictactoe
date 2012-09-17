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
    UIButton *button;
    int currentPlayer;
}
@property int currentPlayer;
@property (nonatomic, retain) IBOutlet UIButton *button;
- (IBAction)makeMove:(id)sender;
@end
