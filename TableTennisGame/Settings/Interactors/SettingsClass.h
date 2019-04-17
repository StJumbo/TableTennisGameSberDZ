//
//  SettingsClass.h
//  TableTennisGame
//
//  Created by Сергей Грызин on 12/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsClass : NSObject
{
    double speed;
    int theme;
    double difficulty;
}

@property (nonatomic) double speed;
@property (nonatomic) int theme;
@property (nonatomic) double difficulty;

+ (id) shared;
@end

NS_ASSUME_NONNULL_END
