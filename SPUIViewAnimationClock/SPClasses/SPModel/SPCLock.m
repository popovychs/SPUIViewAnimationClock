	//
//  SPCLock.m
//  SPUIViewAnimationClock
//
//  Created by popovychs on 26.10.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "SPCLock.h"

@interface SPCLock ()

@property (strong,nonatomic) NSCalendar *calendar;
@property (strong,nonatomic) NSDate *currentDate;
@property (strong,nonatomic) NSTimer *timer;

@end

@implementation SPCLock

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect imageViewFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
        _background = [[UIImageView alloc] initWithFrame: imageViewFrame];
        _hoursArrow = [[UIImageView alloc] initWithFrame: imageViewFrame];
        _minutesArrow = [[UIImageView alloc] initWithFrame: imageViewFrame];
        _secondsArrow = [[UIImageView alloc] initWithFrame: imageViewFrame];
        
        [self addSubview: _background];
        [self addSubview: _hoursArrow];
        [self addSubview: _minutesArrow];
        [self addSubview: _secondsArrow];
    }
    
    _calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    return  self;
}

- (void)start
{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                  target:self
                                                selector:@selector(updateTime)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)updateTime
{
    self.currentDate = [NSDate date];
    
    [UIView animateWithDuration:1.0f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveLinear
                     animations:^ {
                         [self updateHoursHand];
                         [self updateMinutesHand];
                         [self updateSecondsHand];
                     }
                     completion:nil];
}

- (void)updateHoursHand
{
    NSInteger degreesPerHour   = 30;
    NSInteger degreesPerMinute = 6;
    
    double degreesForHours = ([self hours] % 12) * degreesPerHour;
    double degreesForMinutes = ([self minutes] / 12) * degreesPerMinute;
    double totalDegrees = degreesForHours + degreesForMinutes;
    
    double hourRadianAngle = totalDegrees * M_PI / 180;
    
    self.hoursArrow.transform = CGAffineTransformRotate(CGAffineTransformIdentity, hourRadianAngle);
}

- (void)updateMinutesHand
{
    NSInteger degreesPerMinute = 6;
    double degreesPerSecond = 1.2f;
    
    double degreesForMinutes = [self minutes] * degreesPerMinute;
    double degreesForSeconds = ([self seconds] / 12) * degreesPerSecond;
    double totalDegrees = degreesForMinutes+degreesForSeconds;
    
    double minutesRadianAngle = totalDegrees * M_PI / 180;
    
    self.minutesArrow.transform = CGAffineTransformRotate(CGAffineTransformIdentity, minutesRadianAngle);
}

- (void)updateSecondsHand
{
    NSInteger degreesPerSecond = 6;
    
    double secondsRadianAngle = ([self seconds] * degreesPerSecond)* M_PI / 180;
    
    self.secondsArrow.transform = CGAffineTransformRotate(CGAffineTransformIdentity, secondsRadianAngle);
}


- (NSInteger) hours
{
    return [self.calendar component:NSCalendarUnitHour fromDate:self.currentDate];
}

- (NSInteger) minutes
{
    return [self.calendar component:NSCalendarUnitMinute fromDate:self.currentDate];
}

- (NSInteger) seconds
{
    return [self.calendar component:NSCalendarUnitSecond fromDate:self.currentDate];
}

@end
