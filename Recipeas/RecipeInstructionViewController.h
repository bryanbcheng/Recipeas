//
//  RecipeInstructionViewController.h
//  Recipeas
//
//  Created by Bryan Cheng on 3/21/15.
//  Copyright (c) 2015 Bryan Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecipeInstructionListViewController.h"
#import "Recipe.h"

@class RecipeInstructionListViewController;

@interface RecipeInstructionViewController : UIViewController

@property (nonatomic, strong) NSArray *oldVCs;
@property (nonatomic, weak) RecipeInstructionListViewController *recipeInstructionListViewController;

@property (strong, nonatomic) Recipe *recipe;
@property (nonatomic, assign) int step;

- (void)updateStep:(int)step;

@end
