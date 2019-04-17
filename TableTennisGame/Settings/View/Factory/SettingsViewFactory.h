//
//  SettingsViewFactory.h
//  TableTennisGame
//
//  Created by Сергей Грызин on 14/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SettingsClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewFactory : NSObject
@property (nonatomic) UIFont *textFont;
@property (nonatomic) UIColor *textColor;
- (NSArray<UIView *> *)makeSettingsCells;
@end

NS_ASSUME_NONNULL_END
