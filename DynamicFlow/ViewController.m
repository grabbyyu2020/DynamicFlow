//
//  ViewController.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "ViewController.h"
#import "DynamicCell.h"
#import "DynamicItemViewFactory.h"
#import "DynamicItemViewModel.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<DynamicItemViewModel *> *dynamicItemViewModels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DynamicItems" ofType:@"plist"];
    self.dynamicItemViewModels = [DynamicItemViewFactory dynamicItemViewModelsWithPlistFilePath:filePath];
    [self.tableView reloadData];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - Setter & Getter

- (UITableView *)tableView {
    if (_tableView) {
        return _tableView;
    }
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    return _tableView;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DynamicItemViewModel *viewModel = self.dynamicItemViewModels[indexPath.row];
    return viewModel.height;
}

#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *reuseIdentifier = NSStringFromClass(DynamicCell.class);
    DynamicCell *dynamicCell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!dynamicCell) {
        dynamicCell = [[DynamicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    DynamicItemViewModel *viewModel = self.dynamicItemViewModels[indexPath.row];
    [dynamicCell renderWithViewModel:viewModel];
    return dynamicCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dynamicItemViewModels.count;
}

@end
