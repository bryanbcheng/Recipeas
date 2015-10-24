//
//  RecipeInstructionViewController.m
//  Recipeas
//
//  Created by Bryan Cheng on 3/21/15.
//  Copyright (c) 2015 Bryan Cheng. All rights reserved.
//

#import "RecipeInstructionViewController.h"
#import "RecipeInstructionView.h"
#import "Recipe.h"

@interface RecipeInstructionViewController () <RecipeInstructionViewDelegate>

@property (strong, nonatomic) RecipeInstructionView *instructionView;

@end

@implementation RecipeInstructionViewController

- (id)init {
    self = [super initWithNibName:nil bundle:nil];
    if (self != nil)
    {
        // Further initialization if needed
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle {
    NSAssert(NO, @"Initialize with -init");
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Add DONE button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(finishButtonClicked:)];
    
    // Set title
    self.navigationController.navigationBar.topItem.title = self.recipe.name;
    
    // Setup view
    self.instructionView = [[RecipeInstructionView alloc] initWithFrame:self.view.bounds];
    self.instructionView.delegate = self;
    
    [self.view addSubview:self.instructionView];
    
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView {
    self.instructionView.instruction = self.recipe.instructions[self.step];
    
    [self.instructionView setNeedsLayout];
}

- (void)nextButtonClicked:(id)sender {
    [self updateStep:self.step + 1];
    [self.recipeInstructionListViewController updateStep:self.step];
}

- (void)updateStep:(int)step {
    self.step = step;
    [self configureView];
}

- (void)finishButtonClicked:(id)sender {
    [self.splitViewController setViewControllers:self.oldVCs];
}

- (BOOL)lastStep {
    return self.recipe.instructions.count == self.step + 1;
}

@end
