//
//  SettingsRouter.m
//  TableTennisGame
//
//  Created by Сергей Грызин on 13/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import "SettingsRouter.h"

@implementation SettingsRouter
-(void)continueGame
{
    [UIView transitionWithView:self.navVC.view
                      duration:0.8f
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        [self.navVC popViewControllerAnimated:NO];
                    } completion:nil];
}
@end
