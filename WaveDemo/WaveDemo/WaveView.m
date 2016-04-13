//
//  WaveView.m
//  WaveDemo
//
//  Created by jiejin on 16/4/8.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import "WaveView.h"

@interface WaveView()

@property (nonatomic, strong) CADisplayLink *waveDisPlayLink;
@property (nonatomic, strong) CAShapeLayer *waveLayer;
@property (nonatomic, assign) CGMutablePathRef path;

@property (nonatomic, assign) CGFloat offsetX;
@property (nonatomic, assign) CGFloat waveHeight;
@property (nonatomic, assign) CGFloat waveWidth;

@end
@implementation WaveView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if(self){
    
        self.layer.masksToBounds  = YES;
        self.waveHeight = frame.size.height/2;
        self.waveWidth  = frame.size.width;
    }
    
    return self;
}


- (void)start{
    
    if(self.waveLayer){
    
        [self.waveLayer removeFromSuperlayer];
        self.waveLayer = nil;
    }
    self.waveLayer = [CAShapeLayer layer];
    
    self.waveLayer.fillColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:self.waveLayer];
    
    self.waveDisPlayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave:)];
    
    [self.waveDisPlayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)getCurrentWave:(CADisplayLink *)displayLink{
    
    self.offsetX += self.waveSpeed;
    self.waveLayer.path = [self getgetCurrentWavePath];
}

- (CGPathRef)getgetCurrentWavePath{
    
    if(self.path){
        
        CGPathRelease(self.path);
    }
    self.path = CGPathCreateMutable();
    CGPathMoveToPoint(self.path, nil, 0, self.waveHeight);
    CGFloat y = 0.0f;
    for (float x = 0.0f; x <= self.waveWidth ; x++) {
        
        y = self.waveAmplitude * sinf((360/self.waveWidth) *(x * M_PI / 180) - self.offsetX * M_PI / 180) + (self.frame.size.height - self.waveBottomHeight);
        
        CGPathAddLineToPoint(self.path, nil, x, y);
    }
    
    CGPathAddLineToPoint(self.path, nil, self.waveWidth, self.frame.size.height);
    CGPathAddLineToPoint(self.path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(self.path);
    
    return self.path;
}

- (void)stop{
    
    [self.waveDisPlayLink invalidate];
    self.waveDisPlayLink = nil;
}


@end
