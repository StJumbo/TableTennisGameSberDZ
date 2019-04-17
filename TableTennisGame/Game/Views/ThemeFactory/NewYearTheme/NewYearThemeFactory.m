//
//  NewYearThemeFactory.m
//  TableTennisGame
//
//  Created by Сергей Грызин on 14/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import "NewYearThemeFactory.h"

@implementation NewYearThemeFactory

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
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.timeLabelWidth, 0.0f, view.bounds.size.width - self.timeLabelWidth - self.scoreboardHeight - 20.0f, self.scoreboardHeight)];
    [scoreLabel setFont:[self getThemeFont]];
    [scoreLabel setTextAlignment:NSTextAlignmentCenter];
    scoreLabel.text = @"USER 00:00 COMP";
    [scoreLabel setTextColor:UIColor.whiteColor];
    
    return scoreLabel;
}

- (UIView *)makeBallForView:(UIView *)view;
{
    UIView *ball = [[UIView alloc] initWithFrame:CGRectMake(view.center.x, view.center.y, 20.0f, 20.0f)];
    UIImage *snowflakeImage = [UIImage imageNamed:@"snowflake"];
    UIImageView *snowflakeImageView = [[UIImageView alloc] initWithFrame:ball.bounds];
    [snowflakeImageView setImage:snowflakeImage];
    [ball addSubview:snowflakeImageView];
    
    return ball;
}

- (UIColor *)getBackgroundColor
{
    return UIColor.redColor;
}

- (UIFont *)getThemeFont
{
    UIFont *font = [UIFont fontWithName:@"Baskerville" size:23.0f];
    return font;
}

- (UIColor *)getFontColor
{
    return UIColor.whiteColor;
}

- (UIButton *)makePauseButtonForView:(UIView *)view
{
    UIButton *pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(view.bounds.size.width - self.scoreboardHeight - 20.0f, 0.0f, self.scoreboardHeight + 20.0f, self.scoreboardHeight)];
    [pauseButton setTitle:@"PAUSE" forState:UIControlStateNormal];
    pauseButton.titleLabel.font = [self getThemeFont];
    
    return pauseButton;
}

- (UILabel *)makeTimeLabelForView:(UIView *)view
{
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.timeLabelWidth, self.scoreboardHeight)];
    [timeLabel setFont:[self getThemeFont]];
    timeLabel.text = @"00:00";
    [timeLabel setTextColor:UIColor.whiteColor];
    
    return timeLabel;
}

@end
