//
//  RecipeInstructionListViewController.h
//  Recipeas
//
//  Created by Bryan Cheng on 3/21/15.
//  Copyright (c) 2015 Bryan Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecipeInstructionViewController.h"
#import "Recipe.h"
//@class RecipeInstructionViewController;

@class RecipeInstructionViewController;

@interface RecipeInstructionListViewController : UITableViewController

@property (strong, nonatomic) RecipeInstructionViewController *recipeInstructionViewController;

@property (strong, nonatomic) Recipe *recipe;
@property (nonatomic, assign) int step;

- (void)updateStep:(int)step;

@end

