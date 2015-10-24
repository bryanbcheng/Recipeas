//
//  RecipeListViewController.m
//  Recipeas
//
//  Created by Bryan Cheng on 3/21/15.
//  Copyright (c) 2015 Bryan Cheng. All rights reserved.
//

#import "RecipeListViewController.h"
#import "Recipe.h"

@interface RecipeListViewController ()

@property NSMutableArray *objects;
@end

@implementation RecipeListViewController

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
    // Do any additional setup after loading the view, typically from a nib.
    
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects addObject:@"Tomato and Eggs"];
    [self.objects addObject:@"Chicken Pasta"];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        RecipeStartViewController *controller = (RecipeStartViewController *)[[segue destinationViewController] topViewController];
        [controller setRecipe:[self getRecipeFromJson:((UITableViewCell *)sender).textLabel.text]];
    }
}

- (Recipe *)getRecipeFromJson:(NSString *)recipeName {
    NSString *filePath;
    if ([recipeName isEqualToString:@"Tomato and Eggs"]) {
        filePath = [[NSBundle mainBundle] pathForResource:@"tomatoandegg" ofType:@"json"];
    } else {
        filePath = [[NSBundle mainBundle] pathForResource:@"chickenpasta" ofType:@"json"];
    }
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    Recipe *recipe = [Recipe recipeFromJson:json];
    
    return recipe;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //NSDate *object = self.objects[indexPath.row];
    //cell.textLabel.text = [object description];
    NSString *recipeName = self.objects[indexPath.row];
    cell.textLabel.text = recipeName;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}
/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
*/
@end
