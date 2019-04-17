//
//  AbstractFactoryClass.m
//  TableTennisGame
//
//  Created by Сергей Грызин on 13/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import "ThemeAbstractFactoryClass.h"

@implementation ThemeAbstractFactoryClass

-(void)setTheme:(int)themeNumber
{
    switch (themeNumber) {
        case 0:
            self.delegate = [[NinetiesThemeFactory alloc] init];
            break;
        case 1:
            self.delegate = [[NewYearThemeFactory alloc] init];
            
        default:
            break;
    }
}

@end
