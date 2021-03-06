//
//  ProfileViewController.m
//  iOSExample
//
//  Created by cyoung on 2017/2/22.
//  Copyright © 2017年 maintoco. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileTableViewCell.h"

@interface ProfileViewController () <UITableViewDelegate,UITableViewDataSource> {
    NSMutableArray *marr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_tableView registerNib:[UINib nibWithNibName:@"ProfileTableViewCell" bundle:nil] forCellReuseIdentifier:@"profilecell"];
    marr = [NSMutableArray arrayWithObject:[NSMutableString stringWithFormat:@"row-0"]];
}

- (void)addItem:(id)sender {
    [marr insertObject:[NSMutableString stringWithFormat:@"row-%zd",marr.count] atIndex:0];
    [_tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
}

- (IBAction)removeItem:(id)sender {
    NSIndexPath *indexPath = [_tableView indexPathForCell:[sender superview].superview];
    if (indexPath.row == 0) {
        return;
    }
    [marr removeObjectAtIndex:indexPath.row];
    [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (IBAction)updateItem:(id)sender {
    NSIndexPath *indexPath = [_tableView indexPathForCell:[sender superview].superview];
    
    NSMutableString *removedObj = [marr objectAtIndex:indexPath.row];
    [removedObj appendString:@"更新"];
    [_tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    [_tableView beginUpdates];
    [marr removeObjectAtIndex:indexPath.row];
    [marr insertObject:removedObj atIndex:0];
    [_tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0] toIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [_tableView endUpdates];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return marr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"profilecell"];
    cell.textLabel.text = marr[indexPath.row];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
