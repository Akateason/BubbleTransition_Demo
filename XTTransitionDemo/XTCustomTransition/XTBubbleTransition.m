//
//  XTBubbleTransition.m
//  XTTransitionDemo
//
//  Created by teason on 16/4/21.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "XTBubbleTransition.h"

@interface XTBubbleTransition ()

@property (nonatomic,strong) UIView *bubble ;

@end

@implementation XTBubbleTransition

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.startPoint = CGPointZero ;
        self.duration = .5 ;
        self.transitionMode = XTBubbleTransitionModePresent ;
        self.bubbleColor = [UIColor redColor] ;
    }
    
    return self ;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration ;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView] ;
    
    if (self.transitionMode == XTBubbleTransitionModePresent)
    {
        UIView *presentedControllerView = [transitionContext viewForKey:UITransitionContextToViewKey] ;
        
        CGPoint originalCenter = presentedControllerView.center ;
        CGSize originalSize = presentedControllerView.frame.size ;
        CGFloat lengthX = fmax(self.startPoint.x, originalSize.width - self.startPoint.x) ;
        CGFloat lengthY = fmax(self.startPoint.y, originalSize.height - self.startPoint.y) ;
        CGFloat offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2;
        CGSize size = CGSizeMake(offset, offset);
        
        self.bubble = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        self.bubble.layer.cornerRadius = size.height / 2.0f ;
        self.bubble.center = self.startPoint;
        self.bubble.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
        self.bubble.backgroundColor = self.bubbleColor;
        [containerView addSubview:self.bubble];
        
        presentedControllerView.center = self.startPoint;
        presentedControllerView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
        presentedControllerView.alpha = 0;
        [containerView addSubview:presentedControllerView];
        
        [UIView animateWithDuration:self.duration animations:^{
            
            self.bubble.transform = CGAffineTransformIdentity;
            presentedControllerView.transform = CGAffineTransformIdentity;
            presentedControllerView.alpha = 1;
            presentedControllerView.center = originalCenter;
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:finished];
            
        }];
        
    }
    else if (self.transitionMode == XTBubbleTransitionModeDismiss)
    {
        
        UIView *returningControllerView = [transitionContext viewForKey:UITransitionContextFromViewKey] ;
        
        [UIView animateWithDuration:self.duration animations:^{
            
            self.bubble.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
            returningControllerView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001) ;
            returningControllerView.center = self.startPoint;
            returningControllerView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [returningControllerView removeFromSuperview];
            [self.bubble removeFromSuperview];
            [transitionContext completeTransition:finished];
            
        }];
    }
    else
    {
        
    }
}

@end
