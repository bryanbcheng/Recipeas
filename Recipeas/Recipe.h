//
//  Recipe.h
//  Recipeas
//
//  Created by Bryan Cheng on 3/21/15.
//  Copyright (c) 2015 Bryan Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *descrip;
@property (nonatomic, assign) int prepTime;
@property (nonatomic, assign) int servingSize;
@property (nonatomic, strong) NSArray *ingredients;
@property (nonatomic, strong) NSArray *instructions;

+(Recipe *)recipeFromJson:(NSDictionary *)json;

@end
