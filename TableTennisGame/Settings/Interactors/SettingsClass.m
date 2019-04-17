//
//  SettingsClass.m
//  TableTennisGame
//
//  Created by Сергей Грызин on 12/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import "SettingsClass.h"

@implementation SettingsClass

@synthesize speed;
@synthesize theme;
@synthesize difficulty;

+ (id) shared
{
    static dispatch_once_t pred = 0;
    static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (id)init {
    if (self = [super init]) {
        speed = 1.5;
        theme = 0;
        difficulty = 0.5;
    }
    return self;
}
@end
