//
//  ModalViewController.m
//  XTTransitionDemo
//
//  Created by teason on 16/4/21.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ModalViewController

- (IBAction)closeAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil] ;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.button.layer.cornerRadius = self.button.frame.size.width / 2. ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    
    [UIView animateWithDuration:.5
                     animations:^{
                         self.button.transform = CGAffineTransformMakeRotation( M_PI_4 * 3. ) ;
                     }] ;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated] ;
    
    [UIView animateWithDuration:.5
                     animations:^{
                         self.button.transform = CGAffineTransformIdentity ;
                     }] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
