//
//  SettingsPresenter.h
//  TableTennisGame
//
//  Created by Сергей Грызин on 13/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class SettingsRouter;

NS_ASSUME_NONNULL_BEGIN

@interface SettingsPresenter : NSObject

@property (nonatomic)SettingsRouter *routerDelegate;

@end

NS_ASSUME_NONNULL_END
