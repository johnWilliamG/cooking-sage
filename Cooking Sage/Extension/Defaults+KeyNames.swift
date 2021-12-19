//
//  Defaults+KeyNames.swift
//  Cooking Sage
//
//  Created by John Galloway on 27/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    var favouriteRecipeKey: String {
        return "FavouriteRecipeKey"
    }
    
    @discardableResult
    func add(recipe: Recipe?) -> Bool {
        
        guard let recipeName = recipe?.name else {
            return false
        }
        
        if (object(forKey: favouriteRecipeKey) == nil) {
            set([], forKey: favouriteRecipeKey)
        }
        
        guard var recipeNames = object(forKey: favouriteRecipeKey) as? [String] else {
            return false
        }
        
        if recipeNames.contains(recipeName) {
            return false
        }
        
        recipeNames.append(recipeName)
        set(recipeNames, forKey: favouriteRecipeKey)
        return synchronize()
    }
    
    var recipes: [String] {
        get {
            guard let values = object(forKey: favouriteRecipeKey) as? [String] else {
                return []
            }
            return values
        }
    }
    
}
