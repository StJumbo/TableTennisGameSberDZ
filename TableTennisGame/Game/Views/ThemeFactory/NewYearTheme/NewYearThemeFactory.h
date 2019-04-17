//
//  NewYearThemeFactory.h
//  TableTennisGame
//
//  Created by Сергей Грызин on 14/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeViewFactoryProtocol.h"

@interface NewYearThemeFactory : NSObject <ThemeViewFactoryProtocol>

@property (nonatomic) CGFloat scoreboardHeight;
@property (nonatomic) CGFloat timeLabelWidth;

- (UIView *)makeUserRacketForView:(UIView *)view;
- (UIView *)makeComputerRacketForView:(UIView *)view;
- (UIView *)makeBallForView:(UIView *)view;
- (UIButton *)makePauseButtonForView:(UIView *)view;
- (UILabel *)makeTimeLabelForView:(UIView *)view;
- (UILabel *)makeScoreLabelForView:(UIView *)view;
- (UIColor *)getBackgroundColor;
- (UIFont *)getThemeFont;
- (UIColor *)getFontColor;

@end
