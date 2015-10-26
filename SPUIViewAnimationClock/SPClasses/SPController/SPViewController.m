//
//  SPViewController.m
//  SPUIViewAnimationClock
//
//  Created by popovychs on 27.10.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "SPViewController.h"
#import "SPCLock.h"

@interface SPViewController ()

@property (weak, nonatomic) IBOutlet UIView * analogView;
@property (strong, nonatomic) SPCLock * clockView;

@end

@implementation SPViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self prepareClock];
}

- (void) prepareClock
{
    CGRect clockFrame = CGRectMake(0, 0, 250, 250);
    self.clockView = [[SPCLock alloc] initWithFrame:clockFrame];
    
    self.clockView.background.image = [UIImage imageNamed:@"clock-background.png"];
    self.clockView.hoursArrow.image = [UIImage imageNamed:@"clock-hour-background.png"];
    self.clockView.minutesArrow.image = [UIImage imageNamed:@"clock-min-background.png"];
    self.clockView.secondsArrow.image = [UIImage imageNamed:@"clock-sec-background.png"];
    
    [self.analogView addSubview:self.clockView];
    
    [self.clockView turnOn];
}

@end
