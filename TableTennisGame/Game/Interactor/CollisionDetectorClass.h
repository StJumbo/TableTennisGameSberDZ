//
//  CollisionDetectorClass.h
//  TableTennisGame
//
//  Created by Сергей Грызин on 18/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollisionDetectorClass : NSObject

@property (nonatomic)CGRect ballFrame;
@property (nonatomic)CGRect userRacketFrame;
@property (nonatomic)CGRect computerRacketFrame;
@property (nonatomic)CGRect viewFrame;

- (void)setBallFrame:(CGRect)frame;
- (void)setUserRacketFrame:(CGRect)frame;
- (void)setComputerRacketFrame:(CGRect)frame;
- (void)setViewFrame:(CGRect)frame;

- (BOOL)detectedCollisionWithWalls;
- (BOOL)detectedUserGoal;
- (BOOL)detectedComputerGoal;
- (BOOL)detectCollissionWithUserRacket;
- (BOOL)detectCollissionWithComputerRacket;

@end

NS_ASSUME_NONNULL_END
