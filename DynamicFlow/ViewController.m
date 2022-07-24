//
//  ViewController.m
//  DynamicFlow
//
//  Created by KaiJian Yu on 2022/7/1.
//

#import "ViewController.h"
#import "DynamicCellViewModel.h"
#import "DynamicUserProfileItemViewModel.h"
#import "DynamicCell.h"
#import "DynamicItemViewFactory.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<DynamicCellViewModel *> *dynamicCellViewModels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DynamicItems" ofType:@"plist"];
    NSArray<DynamicItemViewModel *> *dynamicItemViewModels = [DynamicItemViewFactory dynamicItemViewModelsWithPlistFilePath:filePath];
    NSMutableArray<DynamicCellViewModel *> *cellVMs = [NSMutableArray array];
    for (DynamicItemViewModel *itemViewModel in dynamicItemViewModels) {
        DynamicCellViewModel *cellVM = [[DynamicCellViewModel alloc] init];
        cellVM.dynamicItemViewModels = itemViewModel.subItemViewModels;
        [cellVMs addObject:cellVM];
    }
    self.dynamicCellViewModels = cellVMs.copy;
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
    DynamicCellViewModel *viewModel = self.dynamicCellViewModels[indexPath.row];
    return viewModel.height;
}

#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *reuseIdentifier = NSStringFromClass(DynamicCell.class);
    DynamicCell *dynamicCell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!dynamicCell) {
        dynamicCell = [[DynamicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    DynamicCellViewModel *viewModel = self.dynamicCellViewModels[indexPath.row];
    [dynamicCell renderWithViewModel:viewModel];
    return dynamicCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dynamicCellViewModels.count;
}

@end
