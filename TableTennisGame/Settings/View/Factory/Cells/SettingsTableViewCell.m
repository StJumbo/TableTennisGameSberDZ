//
//  SettingsTableViewCell.m
//  TableTennisGame
//
//  Created by Сергей Грызин on 13/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import "SettingsTableViewCell.h"

@implementation SettingsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.contentSettingsView = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, UIScreen.mainScreen.bounds.size.width, 80.0f)];
        
        [self addSubview:self.contentSettingsView];
        [self makeConstraints];
    }
    return self;
}

- (void)makeConstraints
{
    [NSLayoutConstraint activateConstraints:@[[self.contentView.topAnchor constraintEqualToAnchor:self.topAnchor],
                                              [self.contentView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
                                              [self.contentView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
                                              [self.contentView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.contentView.heightAnchor constraintEqualToConstant:80.0f]
                                              ]];
}

@end
