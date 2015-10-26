//
//  ViewController.m
//  SPUIViewAnimationClock
//
//  Created by popovychs on 26.10.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "ViewController.h"
#import "SPCLock.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView * analogView;
@property (strong, nonatomic) SPCLock * clockView;

@end

@implementation ViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    [self setClock];
}

- (void) setClock
{
    CGRect clockFrame = CGRectMake(0, 0, 250, 250);
    self.clockView = [[SPCLock alloc] initWithFrame:clockFrame];
    
    self.clockView.background.image = [UIImage imageNamed:@"clock-background.png"];
    self.clockView.hoursArrow.image = [UIImage imageNamed:@"clock-hour-background.png"];
    self.clockView.minutesArrow.image = [UIImage imageNamed:@"clock-min-background.png"];
    self.clockView.secondsArrow.image = [UIImage imageNamed:@"clock-sec-background.png"];
    
    [self.analogView addSubview:self.clockView];
    
    [self.clockView start];
}

@end
