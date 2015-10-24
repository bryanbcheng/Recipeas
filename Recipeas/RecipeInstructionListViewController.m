//
//  RecipeInstructionListViewController.m
//  Recipeas
//
//  Created by Bryan Cheng on 3/21/15.
//  Copyright (c) 2015 Bryan Cheng. All rights reserved.
//

#import "RecipeInstructionListViewController.h"
#import "RecipeInstructionViewController.h"
#import "Recipe.h"

@interface RecipeInstructionListViewController ()

@end

@implementation RecipeInstructionListViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionTop];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureView];
    
    // reload tableview
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView {
    self.navigationController.navigationBar.topItem.title = [NSString stringWithFormat:@"Step %d of %d", self.step + 1, (int)self.recipe.instructions.count];
}

- (void)updateStep:(int)step {
    self.step = step;
    
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:step inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    [self configureView];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recipe.instructions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InstructionCell" forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InstructionCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"InstructionCell"];
    }
    
    NSDictionary *instruction = self.recipe.instructions[indexPath.row];
    cell.textLabel.text = [instruction objectForKey:@"string"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    [self updateStep:(int)indexPath.row];
    [self.recipeInstructionViewController updateStep:(int)indexPath.row];
}

@end
