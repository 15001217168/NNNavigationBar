//
//  MainViewController.m
//  NNNavigationBarDemo
//
//  Created by GuHaijun on 2018/4/12.
//  Copyright © 2018年 GuHaijun. All rights reserved.
//

#import "MainViewController.h"
#import "ColorOnlyViewController.h"
#import "ImageOnlyViewController.h"
#import "ColorTransitionViewController.h"
#import "ImageTransitionViewController.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"main";
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
}

- (NSArray<NSString *> *)cellData {
    return @[
             @"color background only",
             @"image background only",
             @"color background with transition",
             @"image background with transition",
             ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@""];
    cell.textLabel.text = self.cellData[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = false;
    
    DemoBaseViewController *vc = [DemoBaseViewController new];
    if ([cell.textLabel.text isEqualToString:@"color background only"]) {
        vc = [[ColorOnlyViewController alloc] init];
    }
    if ([cell.textLabel.text isEqualToString:@"image background only"]) {
        vc = [[ImageOnlyViewController alloc] init];
    }
    if ([cell.textLabel.text isEqualToString:@"color background with transition"]) {
        vc = [[ColorTransitionViewController alloc] init];
    }
    if ([cell.textLabel.text isEqualToString:@"image background with transition"]) {
        vc = [[ImageTransitionViewController alloc] init];
    }
    UINavigationController *nav = [[UINavigationController alloc] initWithNavigationBarClass:[UINavigationBar class] toolbarClass:[UIToolbar class]];
    [nav pushViewController:vc animated:false];
    [self presentViewController:nav animated:true completion:nil];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
