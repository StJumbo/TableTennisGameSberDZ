//
//  Router.h
//  TableTennisGame
//
//  Created by Сергей Грызин on 13/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameRouter : NSObject
@property (nonatomic, strong)UINavigationController *navVC;

-(void)showSettings;
@end

NS_ASSUME_NONNULL_END
