//
//  XTCustomSegue.m
//  XTTransitionDemo
//
//  Created by teason on 16/4/21.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "XTCustomSegue.h"

@implementation XTCustomSegue

- (void)perform
{
    [self.sourceViewController presentViewController:self.destinationViewController
                                            animated:YES
                                          completion:^{
                                              
                                          }] ;
}

@end
