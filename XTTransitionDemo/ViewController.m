//
//  ViewController.m
//  XTTransitionDemo
//
//  Created by teason on 16/4/21.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ViewController.h"
#import "XTBubbleTransition.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic,strong) XTBubbleTransition *transition ;

@end

@implementation ViewController

- (XTBubbleTransition *)transition
{
    if (!_transition) {
        _transition = [[XTBubbleTransition alloc] init];
    }
    return _transition;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.button.layer.cornerRadius = self.button.frame.size.width / 2.0f ;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.transition.transitionMode = XTBubbleTransitionModePresent;
    self.transition.startPoint = self.button.center;
    self.transition.bubbleColor = self.button.backgroundColor;
    return self.transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transition.transitionMode = XTBubbleTransitionModeDismiss ;
    self.transition.startPoint = self.button.center;
    self.transition.bubbleColor = self.button.backgroundColor;
    return self.transition;
}

#pragma mark -

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *controller = segue.destinationViewController;
    controller.transitioningDelegate = self;
    controller.modalPresentationStyle = UIModalPresentationCustom;
}

@end
