//
//  RecipeInstructionView.m
//  Recipeas
//
//  Created by Bryan Cheng on 3/22/15.
//  Copyright (c) 2015 Bryan Cheng. All rights reserved.
//

#import "RecipeInstructionView.h"

@interface RecipeInstructionView ()

// View Dictionary
@property (nonatomic, strong) NSDictionary *viewsDictionary;

// Views
@property (nonatomic, strong) UIImageView *ingredientImage;
@property (nonatomic, strong) UITextView *instructionDescription;
@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation RecipeInstructionView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"wood-textures.jpg"]];
        
        self.ingredientImage = [UIImageView new];
        self.ingredientImage.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.ingredientImage];
        
        self.instructionDescription = [UITextView new];
        self.instructionDescription.translatesAutoresizingMaskIntoConstraints = NO;
        self.instructionDescription.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:36.0];
        self.instructionDescription.backgroundColor = [UIColor whiteColor];
        self.instructionDescription.layer.cornerRadius = 30.0f;
        self.instructionDescription.layer.masksToBounds = YES;
        self.instructionDescription.textContainerInset = UIEdgeInsetsMake(25, 25, 25, 25);
        [self addSubview:self.instructionDescription];
        
        self.nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.nextButton.translatesAutoresizingMaskIntoConstraints = NO;
        self.nextButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:36.0];
        
        [self addSubview:self.nextButton];
        
        self.viewsDictionary = @{@"ingredientImage": self.ingredientImage,
                                 @"instructionDescription": self.instructionDescription,
                                 @"nextButton": self.nextButton};
        
        // Setup constraints
        NSArray *image_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[ingredientImage(200)]"
                                                                              options:0
                                                                              metrics:nil
                                                                                views:self.viewsDictionary];
        NSArray *image_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[ingredientImage(200)]"
                                                                              options:0
                                                                              metrics:nil
                                                                                views:self.viewsDictionary];
        [self.ingredientImage addConstraints:image_constraint_V];
        [self.ingredientImage addConstraints:image_constraint_H];
        
        NSLayoutConstraint *image_constraint_pos_V = [NSLayoutConstraint constraintWithItem:self.ingredientImage
                                                                                  attribute:NSLayoutAttributeTop
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self
                                                                                  attribute:NSLayoutAttributeTop
                                                                                 multiplier:1.0f
                                                                                   constant:100.0f];
        
        NSLayoutConstraint *image_constraint_pos_H = [NSLayoutConstraint constraintWithItem:self.ingredientImage
                                                                                  attribute:NSLayoutAttributeCenterX
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self
                                                                                  attribute:NSLayoutAttributeCenterX
                                                                                 multiplier:1.0f
                                                                                   constant:0.0f];
        [self addConstraint:image_constraint_pos_V];
        [self addConstraint:image_constraint_pos_H];
        
        NSArray *instruction_constraint_pos_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-350-[instructionDescription]-150-|"
                                                                                        options:0
                                                                                        metrics:nil
                                                                                          views:self.viewsDictionary];
        NSArray *instruction_constraint_pos_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[instructionDescription]-50-|"
                                                                                        options:0
                                                                                        metrics:nil
                                                                                          views:self.viewsDictionary];
        [self addConstraints:instruction_constraint_pos_V];
        [self addConstraints:instruction_constraint_pos_H];
        
        NSArray *next_button_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[nextButton(50)]"
                                                                              options:0
                                                                              metrics:nil
                                                                                views:self.viewsDictionary];
        [self.nextButton addConstraints:next_button_constraint_V];
        
        NSArray *next_button_constraint_pos_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[nextButton]-50-|"
                                                                                        options:0
                                                                                        metrics:nil
                                                                                          views:self.viewsDictionary];
        NSArray *next_button_constraint_pos_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-250-[nextButton]-250-|"
                                                                                        options:0
                                                                                        metrics:nil
                                                                                          views:self.viewsDictionary];
        [self addConstraints:next_button_constraint_pos_V];
        [self addConstraints:next_button_constraint_pos_H];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews {
    NSArray *ingredients = [self.instruction objectForKey:@"ingredients"];
    NSString *ingredientName;
    if (ingredients.count) {
        ingredientName = ingredients[0];
    } else {
        ingredientName = @"nil";
    }
    [self.ingredientImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpeg", ingredientName]]];
    
    self.instructionDescription.text = [self.instruction objectForKey:@"string"];
    [self.instructionDescription sizeToFit];
    
    if ([self.delegate lastStep]) {
        [self.nextButton removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
        [self.nextButton addTarget:self.delegate action:@selector(finishButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.nextButton setTitle:@"Finish" forState:UIControlStateNormal];
    } else {
        [self.nextButton removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
        [self.nextButton addTarget:self.delegate action:@selector(nextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
    }
}

@end
