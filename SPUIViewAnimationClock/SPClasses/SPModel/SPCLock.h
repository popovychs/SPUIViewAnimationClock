//
//  SPCLock.h
//  SPUIViewAnimationClock
//
//  Created by popovychs on 26.10.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SPCLock : UIView

@property (strong,nonatomic) UIImageView *background;
@property (strong,nonatomic) UIImageView *hoursArrow;
@property (strong,nonatomic) UIImageView *minutesArrow;
@property (strong,nonatomic) UIImageView *secondsArrow;

-(id) initWithFrame:(CGRect)frame;
-(void) turnOn;

@end
