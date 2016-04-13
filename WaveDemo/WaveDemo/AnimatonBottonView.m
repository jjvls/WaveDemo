//
//  AnimatonBottonView.m
//  WaveDemo
//
//  Created by jiejin on 16/4/8.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import "AnimatonBottonView.h"

@interface AnimatonBottonView()

@property (nonatomic, strong) UIView *borderView;
@property (nonatomic, strong) UIButton *insideButton;

@end

@implementation AnimatonBottonView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.borderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        self.borderView.layer.borderWidth = 2;
        self.borderView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.borderView.layer.cornerRadius = 30;
        self.borderView.layer.masksToBounds = YES;
        
        CGRect buttonRect = CGRectInset(self.borderView.bounds, 2, 2);
        self.insideButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.insideButton.frame = buttonRect;
        self.insideButton.layer.masksToBounds = YES;
        self.insideButton.layer.cornerRadius = 30;
        [self.insideButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.insideButton setTitle:@"CLICK" forState:UIControlStateNormal];
        [self.insideButton addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.borderView];
        [self addSubview:self.self.insideButton];
    }
    
    return self;
}

- (void)startAnimation
{
    self.insideButton.backgroundColor = [UIColor blackColor];
    [UIView animateWithDuration:0.5 animations:^{
        self.borderView.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.borderView.alpha = 0;
        
        self.insideButton.alpha = 0;
        
    } completion:^(BOOL finished) {
        self.borderView.transform = CGAffineTransformIdentity;
        self.borderView.alpha = 1;
        
        self.insideButton.alpha = 1;
        self.insideButton.backgroundColor = [UIColor clearColor];
        
    }];
    
    if ([self.delegate respondsToSelector:@selector(buttonDidClick)]) {
        [self.delegate buttonDidClick];
    }
}

@end
