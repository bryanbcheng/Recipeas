//
//  RecipeStartViewController.m
//  Recipeas
//
//  Created by Bryan Cheng on 3/21/15.
//  Copyright (c) 2015 Bryan Cheng. All rights reserved.
//

#import "RecipeStartViewController.h"
#import "RecipeInstructionListViewController.h"
#import "RecipeInstructionViewController.h"

@interface RecipeStartViewController ()

@end

@implementation RecipeStartViewController

#pragma mark - Managing the detail item

- (void)setRecipe:(Recipe *)newRecipe {
    if (_recipe != newRecipe) {
        _recipe = newRecipe;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.recipe) {
        self.recipeDescription.text = self.recipe.descrip;
        self.recipePreparationTimeLabel.text = [NSString stringWithFormat:@"%d min",self.recipe.prepTime];
        self.recipeServingSizeLabel.text = [NSString stringWithFormat:@"%d servings",self.recipe.servingSize];
        self.recipeIngredientsList.text = @"asdf";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startRecipe:(UIButton *)sender {
    // load instructionviewcontroller
    
    RecipeInstructionListViewController *instructionListVC = [[RecipeInstructionListViewController alloc] init];
    [instructionListVC setRecipe:self.recipe];
    [instructionListVC setStep:0];
    UINavigationController *leftNavVC = [[UINavigationController alloc] initWithRootViewController:instructionListVC];
    
    RecipeInstructionViewController *instructionVC = [[RecipeInstructionViewController alloc] init];
    [instructionVC setRecipe:self.recipe];
    [instructionVC setStep:0];
    UINavigationController *rightNavVC = [[UINavigationController alloc] initWithRootViewController:instructionVC];
    
    // Set master/detail vcs as delegates
    instructionListVC.recipeInstructionViewController = instructionVC;
    instructionVC.recipeInstructionListViewController = instructionListVC;
    instructionVC.oldVCs = self.splitViewController.viewControllers;
    
    NSArray *newVCs = @[leftNavVC, rightNavVC];
    [self.splitViewController setViewControllers:newVCs];
}

@end
