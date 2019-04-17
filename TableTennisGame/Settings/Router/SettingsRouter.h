//
//  SettingsRouter.h
//  TableTennisGame
//
//  Created by Сергей Грызин on 13/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GameViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsRouter : NSObject
@property (nonatomic, weak)UINavigationController *navVC;

-(void)continueGame;
@end

NS_ASSUME_NONNULL_END
