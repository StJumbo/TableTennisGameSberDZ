//
//  CollisionDetectorClass.m
//  TableTennisGame
//
//  Created by Сергей Грызин on 18/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import "CollisionDetectorClass.h"

//@interface CollisionDetectorClass 
//
//@property (nonatomic)CGRect ballFrame;
//@property (nonatomic)CGRect userRacketFrame;
//@property (nonatomic)CGRect computerRacketFrame;
//@property (nonatomic)CGRect viewFrame;
//
//@end

@implementation CollisionDetectorClass


//MARK: - Collision detectors

- (BOOL)detectedCollisionWithWalls
{
    return (((self.ballFrame.origin.x + self.ballFrame.size.width) > self.viewFrame.size.width)
            || (self.ballFrame.origin.x < 0)) ? YES : NO;
}

- (BOOL)detectedUserGoal
{
    return (self.ballFrame.origin.y < self.viewFrame.origin.y) ? YES : NO;
}

- (BOOL)detectedComputerGoal
{
    return ((self.ballFrame.origin.y + self.ballFrame.size.height) > self.viewFrame.origin.y + self.viewFrame.size.height) ? YES : NO;
}

- (BOOL)detectCollissionWithUserRacket
{
    return ((self.ballFrame.origin.y + self.ballFrame.size.height > self.userRacketFrame.origin.y)
            && (self.ballFrame.origin.x + self.ballFrame.size.width < self.userRacketFrame.origin.x + self.userRacketFrame.size.width)
            && (self.ballFrame.origin.x > self.userRacketFrame.origin.x)) ? YES : NO;
}

- (BOOL)detectCollissionWithComputerRacket
{
    return ((self.ballFrame.origin.y < self.computerRacketFrame.origin.y + self.computerRacketFrame.size.height)
            && (self.ballFrame.origin.x + self.ballFrame.size.width < self.computerRacketFrame.origin.x + self.computerRacketFrame.size.width)
            && (self.ballFrame.origin.x > self.computerRacketFrame.origin.x)) ? YES : NO;
}


@end
