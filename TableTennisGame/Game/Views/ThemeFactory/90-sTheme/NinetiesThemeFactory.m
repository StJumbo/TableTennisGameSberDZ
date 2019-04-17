//
//  NinetiesThemeFactory.m
//  TableTennisGame
//
//  Created by Сергей Грызин on 13/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import "NinetiesThemeFactory.h"


@implementation NinetiesThemeFactory


- (UIView *)makeUserRacketForView:(UIView *)view;
{
    UIView *racket = [[UIView alloc] initWithFrame:CGRectMake(view.center.x - 30.0f, view.frame.size.height - 15.0f, 60.0f, 10.0f)];
    racket.backgroundColor = UIColor.whiteColor;
    
    return racket;
}

- (UIView *)makeComputerRacketForView:(UIView *)view;
{
    UIView *racket = [[UIView alloc] initWithFrame:CGRectMake(view.center.x - 30.0f, view.frame.origin.y + _scoreboardHeight + 5.0f, 60.0f, 10.0f)];
    racket.backgroundColor = UIColor.whiteColor;
    
    return racket;
}

- (UIView *)makeScoreLabelForView:(UIView *)view;
{
    UIFont *font = [UIFont fontWithName:@"Verdana" size:23.0f];
    
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.timeLabelWidth, 0.0f, view.bounds.size.width - self.timeLabelWidth - self.scoreboardHeight - 20.0f, self.scoreboardHeight)];
    [scoreLabel setFont:font];
    [scoreLabel setTextAlignment:NSTextAlignmentCenter];
    scoreLabel.text = @"USER 00:00 COMP";
    [scoreLabel setTextColor:UIColor.whiteColor];
    
    return scoreLabel;
}

- (UIView *)makeBallForView:(UIView *)view;
{
    UIView *ball = [[UIView alloc] initWithFrame:CGRectMake(view.center.x, view.center.y, 10.0f, 10.0f)];
    ball.backgroundColor = UIColor.whiteColor;
    
    return ball;
}

- (UIColor *)getBackgroundColor
{
    return UIColor.blackColor;
}

- (UIFont *)getThemeFont
{
    return [UIFont fontWithName:@"Verdana" size:23.0f];
}

- (UIColor *)getFontColor
{
    return UIColor.whiteColor;
}

- (UIButton *)makePauseButtonForView:(UIView *)view
{
    UIButton *pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(view.bounds.size.width - self.scoreboardHeight - 20.0f, 0.0f, self.scoreboardHeight + 20.0f, self.scoreboardHeight)];
    [pauseButton setTitle:@"PAUSE" forState:UIControlStateNormal];
    
    return pauseButton;
}

- (UILabel *)makeTimeLabelForView:(UIView *)view
{
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.timeLabelWidth, self.scoreboardHeight)];
    
    
    [timeLabel setFont:[self getThemeFont] ];
    timeLabel.text = @"00:00";
    [timeLabel setTextColor:UIColor.whiteColor];
    
    return timeLabel;
}

@end
