//
//  Dice.h
//  Simple Dice
//
//  Created by Johannes Warn on 2017-11-04.
//  Copyright © 2017 Johannes Wärn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

+ (Dice *)diceWithFaces:(NSArray<NSString *> *)faces title:(NSString *)title;
+ (Dice *)sixSided;
+ (Dice *)alphabet;
+ (Dice *)coin;

@property (nonatomic) NSArray<NSString *> *faces;
@property (nonatomic) NSString *title;
- (NSString *)randomFace;

@end
