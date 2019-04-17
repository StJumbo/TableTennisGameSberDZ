//
//  ViewController.m
//  TableTennisGame
//
//  Created by Сергей Грызин on 28/03/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController () <UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIView *ball;
@property (nonatomic, strong) UIView *computerRacket;
@property (nonatomic, strong) UIView *userRacket;
@property (nonatomic, strong) UIPanGestureRecognizer *userRacketPanGestureRecognizer;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSTimer *stopwatch;
@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *pauseButton;
@property (nonatomic) CGFloat dx;
@property (nonatomic) CGFloat dy;
@property (nonatomic) int userGoals;
@property (nonatomic) int computerGoals;
@property (nonatomic) int seconds;
@property (nonatomic) CGFloat computerRacketdx;
@property (nonatomic) ThemeAbstractFactoryClass *factory;
@property (nonatomic, strong) SettingsClass *settings;
@property (nonatomic, strong) GamePresenter *presenter;
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.settings = [SettingsClass shared];
    
    self.presenter = [GamePresenter new];
    self.presenter.routerDelegate = [GameRouter new];
    self.presenter.routerDelegate.navVC = self.navigationController;
    
    self.factory = [ThemeAbstractFactoryClass new];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
    self.stopwatch = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
    
    [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
    [self.stopwatch setFireDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.factory setTheme:self.settings.theme];
    [self.factory.delegate setTimeLabelWidth:69.0f];
    [self.factory.delegate setScoreboardHeight:50.0f];
    
    self.view = [[UIView alloc] initWithFrame:self.view.frame];
    [self.navigationController setNavigationBarHidden:YES];
    [self.view setBackgroundColor:[self.factory.delegate getBackgroundColor]];
    
    self.ball = [self.factory.delegate makeBallForView:self.view];
    [self.view addSubview:[self ball]];
    
    self.userRacket = [self.factory.delegate makeUserRacketForView:self.view];
    [self.view addSubview:[self userRacket]];
    
    self.computerRacket = [self.factory.delegate makeComputerRacketForView:self.view];
    [self.view addSubview:[self computerRacket]];
    
    self.timeLabel = [self.factory.delegate makeTimeLabelForView:self.view];
    [self.view addSubview:[self timeLabel]];
    
    self.scoreLabel = [self.factory.delegate makeScoreLabelForView:self.view];
    [self.view addSubview:[self scoreLabel]];
    
    self.pauseButton = [self.factory.delegate makePauseButtonForView:self.view];
    [self.view addSubview:[self pauseButton]];
    [self.pauseButton addTarget:self action:@selector(goToPause) forControlEvents:UIControlEventTouchUpInside];
    
    [self addGestureRecognizerToUserRacket];
    
    self.dx = self.settings.speed;
    self.dy = self.settings.speed;
    self.computerRacketdx = self.settings.speed * self.settings.difficulty;
    self.computerGoals = 0;
    self.userGoals = 0;
    self.seconds = 0;
}

- (void)changeTime
{
    self.seconds += 1;
    NSDate *time = [NSDate dateWithTimeIntervalSinceReferenceDate:self.seconds];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mm:ss"];
    self.timeLabel.text = [dateFormatter stringFromDate:time];
}


//MARK: - Moving views

- (void)moveBall
{
    [self detectCollisionWithWalls];
    [self detectCollissionWithUserRacket];
    [self detectCollissionWithComputerRacket];
    [self detectGoal];
    [self moveComputerRacket];
    self.ball.center = CGPointMake(self.ball.center.x + self.dx, self.ball.center.y + self.dy);
}

- (void)moveComputerRacket
{
    if (self.ball.center.x > self.computerRacket.center.x)
    {
        [self.computerRacket setCenter:CGPointMake(self.computerRacket.center.x + self.computerRacketdx, self.computerRacket.center.y)];
    }
    
    if (self.ball.center.x < self.computerRacket.center.x)
    {
        [self.computerRacket setCenter:CGPointMake(self.computerRacket.center.x - self.computerRacketdx, self.computerRacket.center.y)];
    }
}

- (void)moveUserRacket
{
    if (self.userRacketPanGestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        CGPoint touchPosition = [self.userRacketPanGestureRecognizer locationInView:self.view];
        CGPoint point = CGPointMake(touchPosition.x, self.userRacket.center.y);
        [self.userRacket setCenter:point];
    }
}


//MARK: - Detecting collisions

- (void)detectCollisionWithWalls
{
    if (((self.ball.frame.origin.x + self.ball.frame.size.width) > self.view.frame.size.width) || (self.ball.frame.origin.x < 0))
    {
        self.dx *= -1;
    }
}

- (void)detectGoal
{
    if ((self.ball.frame.origin.y + self.ball.frame.size.height) > self.view.frame.size.height)
    {
        self.computerGoals += 1;
        [self restartAfterGoal];
    }
        
    if (self.ball.frame.origin.y < self.view.frame.origin.y + self.scoreLabel.frame.size.height)
    {
        self.userGoals += 1;
        [self restartAfterGoal];
    }
}

- (void)restartAfterGoal
{
    self.dy *= -1;
    [self.ball setCenter:self.view.center];
    self.scoreLabel.text = [NSString stringWithFormat:@"USER 0%i:0%i COMP", self.userGoals, self.computerGoals];
    //сделать паузу в 2 секунды
    [self.timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
    [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
    [self.userRacket setCenter:CGPointMake(self.view.center.x, self.userRacket.center.y)];
    [self.computerRacket setCenter:CGPointMake(self.view.center.x, self.computerRacket.center.y)];
}

- (void)detectCollissionWithUserRacket
{
    if ((self.ball.frame.origin.y + self.ball.frame.size.height > self.userRacket.frame.origin.y) && (self.ball.center.x < self.userRacket.frame.origin.x + self.userRacket.frame.size.width) && (self.ball.center.x > self.userRacket.frame.origin.x))
    {
        self.dy *= -1;
    }
}

- (void)detectCollissionWithComputerRacket
{
    if ((self.ball.frame.origin.y < self.computerRacket.frame.origin.y + self.computerRacket.frame.size.height) && (self.ball.center.x < self.computerRacket.frame.origin.x + self.computerRacket.frame.size.width) && (self.ball.center.x > self.computerRacket.frame.origin.x))
    {
        self.dy *= -1;
    }
}


//MARK: - Button press action

- (void)goToPause
{
    [self.presenter.routerDelegate showSettings];
}


//MARK: - Gesture recognizers

- (void)addGestureRecognizerToUserRacket
{
    UIPanGestureRecognizer *userRacketPanGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveUserRacket)];
    [self.view addGestureRecognizer:userRacketPanGestureRecognizer];
    self.userRacketPanGestureRecognizer = userRacketPanGestureRecognizer;
}


//MARK: - Hide status bar

- (BOOL)prefersStatusBarHidden {
    return YES;
}


@end
