//
//  Recipe.m
//  Recipeas
//
//  Created by Bryan Cheng on 3/21/15.
//  Copyright (c) 2015 Bryan Cheng. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

+(Recipe *)recipeFromJson:(NSDictionary *)json {
    Recipe *recipe = [[Recipe alloc] init];
    
    recipe.name = [json objectForKey:@"name"];
    recipe.descrip = [json objectForKey:@"description"];
    recipe.prepTime = [[json objectForKey:@"prepTime"] intValue];
    recipe.servingSize = [[json objectForKey:@"servingSize"] intValue];
    recipe.ingredients = [json objectForKey:@"ingredients"];
    recipe.instructions = [json objectForKey:@"instructions"];
    
    return recipe;
}

@end
