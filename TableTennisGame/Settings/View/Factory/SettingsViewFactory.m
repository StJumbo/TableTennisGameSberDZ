//
//  SettingsViewFactory.m
//  TableTennisGame
//
//  Created by Сергей Грызин on 14/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import "SettingsViewFactory.h"
#import <UIKit/UIKit.h>

@implementation SettingsViewFactory
- (NSArray<UIView *> *)makeSettingsCells
{
    NSMutableArray<UIView *> *viewsArray = [NSMutableArray new];
    [viewsArray addObject:[self makeNameLabel]];
    [viewsArray addObject:[self makeSpeedSlider]];
    [viewsArray addObject:[self makeDifficultCell]];
    [viewsArray addObject:[self makeThemeChoiser]];
    [viewsArray addObject:[self makeReturnButton]];
    return viewsArray;
}

- (UIView *)makeNameLabel
{
    UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, UIScreen.mainScreen.bounds.size.width, 44.0f)];
    UILabel *annotationLabel = [[UILabel alloc] initWithFrame:cellView.frame];
    [annotationLabel setTextAlignment:NSTextAlignmentCenter];
    UIFont *font = [UIFont fontWithName:self.textFont.fontName size:25.0f];
    annotationLabel.text = @"SETTINGS";
    [annotationLabel setFont:font];
    annotationLabel.textColor = self.textColor;
    [cellView addSubview:annotationLabel];
    return cellView;
}

- (UIView *)makeDifficultCell
{
    UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, UIScreen.mainScreen.bounds.size.width, 44.0f)];
    UILabel *annotationLabel = [[UILabel alloc] initWithFrame:CGRectMake(cellView.bounds.origin.x, cellView.bounds.origin.y, 80.0f, cellView.bounds.size.height)];
    UIFont *font = [UIFont fontWithName:self.textFont.fontName size:16.0f];
    annotationLabel.text = @"Difficulty:";
    annotationLabel.font = font;
    annotationLabel.textColor = self.textColor;
    UISegmentedControl *difficultySegmentedControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(cellView.bounds.origin.x + annotationLabel.frame.size.width, cellView.bounds.origin.y, cellView.bounds.size.width - annotationLabel.frame.size.width, cellView.bounds.size.height)];
    [difficultySegmentedControl insertSegmentWithTitle:@"Easy" atIndex:0 animated:NO];
    [difficultySegmentedControl insertSegmentWithTitle:@"Normal" atIndex:1 animated:NO];
    [difficultySegmentedControl insertSegmentWithTitle:@"Hard" atIndex:2 animated:NO];
    [difficultySegmentedControl insertSegmentWithTitle:@"Impossibru" atIndex:3 animated:NO];
    [difficultySegmentedControl setTintColor:UIColor.whiteColor];
    [difficultySegmentedControl addTarget:self action:@selector(setDifficultyAtSettings:) forControlEvents:UIControlEventValueChanged];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    [difficultySegmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [cellView addSubview:annotationLabel];
    [cellView addSubview:difficultySegmentedControl];
    SettingsClass *settings = [SettingsClass shared];
    long value = 0;
    if (settings.difficulty == 0.65)
    {
        value = 1;
    }
    else if (settings.difficulty == 0.85)
    {
        value = 2;
    }
    else if (settings.difficulty == 1.0)
    {
        value = 3;
    }
    [difficultySegmentedControl setSelectedSegmentIndex:value];
    return cellView;
}

- (UIView *)makeSpeedSlider
{
    UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, UIScreen.mainScreen.bounds.size.width, 44.0f)];
    UILabel *annotationLabel = [[UILabel alloc] initWithFrame:CGRectMake(cellView.bounds.origin.x, cellView.bounds.origin.y, 80.0f, cellView.bounds.size.height)];
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(cellView.bounds.origin.x + annotationLabel.frame.size.width, cellView.bounds.origin.y, cellView.bounds.size.width - annotationLabel.frame.size.width, cellView.bounds.size.height)];
    SettingsClass *settings = [SettingsClass shared];
    
    slider.minimumValue = 1.5f;
    slider.maximumValue = 3.5f;
    [slider setValue:settings.speed];
    [slider addTarget:self action:@selector(setSpeedAtSettings:) forControlEvents:UIControlEventValueChanged];
    
    UIFont *font = [UIFont fontWithName:self.textFont.fontName size:16.0f];
    annotationLabel.text = @"Speed:";
    annotationLabel.font = font;
    annotationLabel.textColor = self.textColor;
    [cellView addSubview:annotationLabel];
    [cellView addSubview:slider];
    return cellView;
}

- (UIView *)makeThemeChoiser
{
    UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, UIScreen.mainScreen.bounds.size.width, 44.0f)];
    UILabel *annotationLabel = [[UILabel alloc] initWithFrame:CGRectMake(cellView.bounds.origin.x, cellView.bounds.origin.y, 80.0f, cellView.bounds.size.height)];
    annotationLabel.text = @"Theme:";
    annotationLabel.textColor = self.textColor;
    UIFont *font = [UIFont fontWithName:self.textFont.fontName size:16.0f];
    annotationLabel.font = font;
    UISegmentedControl *themeSegmentedControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(cellView.bounds.origin.x + annotationLabel.frame.size.width, cellView.bounds.origin.y, cellView.bounds.size.width - annotationLabel.frame.size.width, cellView.bounds.size.height)];
    [themeSegmentedControl insertSegmentWithTitle:@"90-s" atIndex:0 animated:NO];
    [themeSegmentedControl insertSegmentWithTitle:@"New Year" atIndex:1 animated:NO];
    [themeSegmentedControl setTintColor:UIColor.whiteColor];
    [themeSegmentedControl addTarget:self action:@selector(setThemeAtSettings:) forControlEvents:UIControlEventValueChanged];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    [themeSegmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [cellView addSubview:annotationLabel];
    [cellView addSubview:themeSegmentedControl];
    
    SettingsClass *settings = [SettingsClass shared];
    
    [themeSegmentedControl setSelectedSegmentIndex:settings.theme];
    return cellView;
}

- (UIButton *)makeReturnButton
{
    UIButton *returnButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, UIScreen.mainScreen.bounds.size.width, 44.0f)];
    [returnButton setTitle:@"Return to game" forState:UIControlStateNormal];
    returnButton.titleLabel.font = self.textFont;
    [returnButton setBackgroundColor:UIColor.greenColor];
    return returnButton;
}

- (void)setSpeedAtSettings:(UISlider *)sender
{
    SettingsClass *settings = [SettingsClass shared];
    settings.speed = [sender value];
}

- (void)setThemeAtSettings:(UISegmentedControl *)sender
{
    SettingsClass *settings = [SettingsClass shared];
    settings.theme = [sender selectedSegmentIndex];
}

- (void)setDifficultyAtSettings:(UISegmentedControl *)sender
{
    SettingsClass *settings = [SettingsClass shared];
    long selectedDifficulty = [sender selectedSegmentIndex];
    
    switch (selectedDifficulty) {
        case 0:
            settings.difficulty = 0.5;
            break;
        case 1:
            settings.difficulty = 0.65;
            break;
        case 2:
            settings.difficulty = 0.85;
            break;
        case 3:
            settings.difficulty = 1.0;
            break;
        default:
            settings.difficulty = 0.5;
            break;
    }
}

@end
