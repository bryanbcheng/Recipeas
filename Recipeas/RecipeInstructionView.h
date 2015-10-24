//
//  RecipeInstructionView.h
//  Recipeas
//
//  Created by Bryan Cheng on 3/22/15.
//  Copyright (c) 2015 Bryan Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RecipeInstructionViewDelegate

- (void)nextButtonClicked:(id)sender;
- (void)finishButtonClicked:(id)sender;
- (BOOL)lastStep;

@end

@interface RecipeInstructionView : UIView

@property (nonatomic, weak) id<RecipeInstructionViewDelegate> delegate;
@property (nonatomic, strong) NSDictionary *instruction;

@end
