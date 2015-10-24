//
//  RecipeStartViewController.h
//  Recipeas
//
//  Created by Bryan Cheng on 3/21/15.
//  Copyright (c) 2015 Bryan Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface RecipeStartViewController : UIViewController

@property (strong, nonatomic) Recipe *recipe;
@property (weak, nonatomic) IBOutlet UITextView *recipeDescription;
@property (weak, nonatomic) IBOutlet UILabel *recipePreparationTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *recipeServingSizeLabel;
@property (weak, nonatomic) IBOutlet UITextView *recipeIngredientsList;

@end

