//
//  Dice.m
//  Simple Dice
//
//  Created by Johannes Warn on 2017-11-04.
//  Copyright © 2017 Johannes Wärn. All rights reserved.
//

#import "Dice.h"

@implementation Dice

+ (Dice *)diceWithFaces:(NSArray<NSString *> *)faces title:(NSString *)title
{
    Dice *dice = [[Dice alloc] init];
    [dice setFaces:faces];
    [dice setTitle:title];
    return dice;
}

+ (Dice *)sixSided
{
    return [self diceWithFaces:@[@"1", @"2", @"3", @"4", @"5", @"6"]
                         title:@"Six sided"];
}

+ (Dice *)alphabet
{
    return [self diceWithFaces:@[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"]
                         title:@"Alphabet"];
}

+ (Dice *)coin
{
    return [self diceWithFaces:@[@"H", @"T"]
                         title:@"Coin toss"];
}

- (NSString *)randomFace
{
    return [self.faces objectAtIndex:arc4random_uniform((uint32_t)self.faces.count)];
}

@end
