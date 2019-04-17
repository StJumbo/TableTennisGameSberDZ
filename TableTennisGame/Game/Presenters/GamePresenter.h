//
//  GamePresenter.h
//  TableTennisGame
//
//  Created by Сергей Грызин on 13/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class GameRouter;

NS_ASSUME_NONNULL_BEGIN

@interface GamePresenter : NSObject

@property (nonatomic, strong)GameRouter *routerDelegate;

@end

NS_ASSUME_NONNULL_END
