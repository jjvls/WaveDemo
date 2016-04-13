//
//  AnimatonBottonView.h
//  WaveDemo
//
//  Created by jiejin on 16/4/8.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AnimatonBottonViewDelegate <NSObject>

- (void)buttonDidClick;

@end

@interface AnimatonBottonView : UIView

@property (nonatomic, weak) id<AnimatonBottonViewDelegate> delegate;

@end
