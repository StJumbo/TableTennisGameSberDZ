//
//  AbstractFactoryClass.h
//  TableTennisGame
//
//  Created by Сергей Грызин on 13/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeViewFactoryProtocol.h"
#import "NinetiesThemeFactory.h"
#import "NewYearThemeFactory.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThemeAbstractFactoryClass : NSObject

@property (nonatomic) id<ThemeViewFactoryProtocol> delegate;

-(void)setTheme:(int)themeNumber;

@end

NS_ASSUME_NONNULL_END
