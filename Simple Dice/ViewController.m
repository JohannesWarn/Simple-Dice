//
//  ViewController.m
//  Simple Dice
//
//  Created by Johannes Warn on 2017-11-04.
//  Copyright © 2017 Johannes Wärn. All rights reserved.
//

#import "ViewController.h"
#import "DiceTypeTableViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *diceTitle;
@property (weak, nonatomic) IBOutlet UILabel *diceFace;
@property (weak, nonatomic) IBOutlet UILabel *instruction;

@property (nonatomic, getter=isShaking) BOOL shaking;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *lastFaces = [[NSUserDefaults standardUserDefaults] objectForKey:@"diceFaces"];
    NSString *lastTitle = [[NSUserDefaults standardUserDefaults] objectForKey:@"diceTitle"];
    if (lastFaces && lastTitle) {
        self.currentDice = [Dice diceWithFaces:lastFaces title:lastTitle];
    } else {
        self.currentDice = [Dice sixSided];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)setCurrentDice:(Dice *)currentDice
{
    _currentDice = currentDice;
    self.diceFace.text = [currentDice.faces lastObject];
    self.diceTitle.text = currentDice.title;
    
    [[NSUserDefaults standardUserDefaults] setObject:currentDice.faces forKey:@"diceFaces"];
    [[NSUserDefaults standardUserDefaults] setObject:currentDice.title forKey:@"diceTitle"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(id)sender {
    if (self.shaking) { return; }
    
    [self shake];
}

- (void)shake
{
    self.shaking = YES;
    
    for (double time = 0.03; time < 0.6; time *= (1.4 + drand48() * 0.2)) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.diceFace.text = [self.currentDice randomFace];
        });
    }
    
    UIView *view = self.diceFace;
    view.transform = CGAffineTransformRotate(CGAffineTransformMakeTranslation(50, 0), 0.0);
    [UIView animateWithDuration:0.8 + drand48() * 0.1
                          delay:0.0
         usingSpringWithDamping:0.1 + drand48() * 0.02
          initialSpringVelocity:6.0 + drand48() * 0.2
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
        view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.shaking = NO;
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[DiceTypeTableViewController class]]) {
        DiceTypeTableViewController *diceTypeTableViewController = segue.destinationViewController;
        diceTypeTableViewController.viewController = self;
    }
}

@end
