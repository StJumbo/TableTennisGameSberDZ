//
//  Router.m
//  TableTennisGame
//
//  Created by Сергей Грызин on 13/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import "GameRouter.h"

@implementation GameRouter

-(void)showSettings
{
    [self.navVC.view.layer removeAllAnimations];
    SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
    [UIView transitionWithView:self.navVC.view
                      duration:0.8f
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
        [self.navVC pushViewController:settingsVC animated:NO];
    } completion:nil];
}

@end
