//
//  ViewController.m
//  SuperStoryboard
//
//  Created by 林东杰 on 11/29/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource> {
    NSInteger rowCount;
}
@property (weak, nonatomic) IBOutlet UITableView *mTableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    rowCount = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"customCell"];
    cell.cellBlock = ^(BOOL isDelete, NSIndexPath *index) {
        if (isDelete) {
            [_mTableView beginUpdates];
            rowCount--;
            [_mTableView deleteRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationRight];
            [_mTableView endUpdates];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [_mTableView reloadData];
            });
        }
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
