//
//  XTBubbleTransition.h
//  XTTransitionDemo
//
//  Created by teason on 16/4/21.
//  Copyright © 2016年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XTBubbleTransitionMode) {
    XTBubbleTransitionModePresent,
    XTBubbleTransitionModeDismiss,
} ;

@interface XTBubbleTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) CGPoint startPoint ;
@property (nonatomic) CGFloat duration ;
@property (nonatomic) XTBubbleTransitionMode transitionMode ;
@property (nonatomic) UIColor *bubbleColor ;

@end
