//
//  SettingsViewController.m
//  TableTennisGame
//
//  Created by Сергей Грызин on 13/04/2019.
//  Copyright © 2019 Сергей Грызин. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray<UIView *> *viewArray;
@property (nonatomic, strong) SettingsViewFactory *settingsFactory;
@property (nonatomic, strong) ThemeAbstractFactoryClass *themeFactory;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SettingsPresenter *presenter;
@property (nonatomic, strong) UIButton *returnButton;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter = [SettingsPresenter new];
    self.presenter.routerDelegate = [SettingsRouter new];
    self.presenter.routerDelegate.navVC = self.navigationController;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.view = [[UIView alloc] initWithFrame:self.view.frame];
    self.viewArray = @[];
    
    //Делаем таблицу
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[SettingsTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //Theme factory
    SettingsClass *settings = [SettingsClass shared];
    self.themeFactory = [ThemeAbstractFactoryClass new];
    [self.themeFactory setTheme:settings.theme];
    [self.tableView setBackgroundColor:[self.themeFactory.delegate getBackgroundColor]];
    
    //Setting factory
    self.settingsFactory = [SettingsViewFactory new];
    self.settingsFactory.textFont = self.themeFactory.delegate.getThemeFont;
    self.settingsFactory.textColor = self.themeFactory.delegate.getFontColor;
    self.viewArray = [self.settingsFactory makeSettingsCells];
    
    [self.tableView setBackgroundColor:[self.themeFactory.delegate getBackgroundColor]];
    
    //Вот тут тонкий и кривой момент- сделал фабрику для ячеек таблицы, которая
    //возвращает массив вьюшек, которые я потом просто добавляю в ячейку. При этом не
    //подумал, как привязывать события этих самых вьюшек. Сделаю очень неправильно, и
    //в фабрике сделаю обработку событий вьюх с синглтоном. А потом сделаю еще
    //неправильнее, и скажу, что псоледний элемент массива- точно кнопка.
    self.returnButton = [self.viewArray lastObject];
    [self.returnButton addTarget:self action:@selector(returnToGame) forControlEvents:UIControlEventTouchUpInside];
}


//MARK: - TableView Delegate&DataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    SettingsTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell addSubview:self.viewArray[indexPath.row]];
    [cell setBackgroundColor:[self.themeFactory.delegate getBackgroundColor]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}


//MARK: - Навигация

- (void)returnToGame
{
    [self.presenter.routerDelegate continueGame];
}

@end
