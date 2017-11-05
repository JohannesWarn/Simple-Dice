//
//  DiceTypeTableViewController.m
//  Simple Dice
//
//  Created by Johannes Warn on 2017-11-04.
//  Copyright © 2017 Johannes Wärn. All rights reserved.
//

#import "DiceTypeTableViewController.h"

@interface DiceTypeTableViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *customDiceTextView;

@end

@implementation DiceTypeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customDiceTextView.text = [self.viewController.currentDice.faces componentsJoinedByString:@" "];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *dices = @[[Dice sixSided], [Dice alphabet], [Dice coin]];
    [self.viewController setCurrentDice:[dices objectAtIndex:indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSRange resultRange = [text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet] options:NSBackwardsSearch];
    if ([text length] == 1 && resultRange.location != NSNotFound) {
        NSString *text = [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSArray *faces = [text componentsSeparatedByString:@" "];
        [self.viewController setCurrentDice:[Dice diceWithFaces:faces title:@"Custom"]];
        [self.navigationController popViewControllerAnimated:YES];
        return NO;
    }
    
    if (range.location >= textView.text.length - 1) {
        textView.text = [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    
    if (text.length > 0 && textView.text.length > 0) {
        textView.text = [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        textView.text = [textView.text stringByAppendingString:@" "];
    }
    
    return YES;
}

@end
