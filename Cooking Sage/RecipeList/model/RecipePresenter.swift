//
//  ReciepeListPresenter.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

protocol PresenterDelegate {
   func didUpdate(presenter: RecipeListPresenter)
}

class RecipeListPresenter {
    
    enum listSection: Int {
        case favourites = 0
        case recipeList = 1 
    }
    
    var delegate: PresenterDelegate?
    var recipes: [Recipe] = []
    
    func loadData() {
        
        recipes = [
            generateFrom(name: "Chicken Pot"),
            generateFrom(name: "Lamb Shanks"),
            generateFrom(name: "Pasta"),
            generateFrom(name: "Chicken Pot"),
            generateFrom(name: "Lamb Shanks"),
            generateFrom(name: "Pasta"),
            generateFrom(name: "Baked"),
            generateFrom(name: "Gambas"),
        ]
        
        delegate?.didUpdate(presenter: self)
    }
    
    func generateFrom(name: String) -> Recipe {
        return Recipe(name: name, image: UIImage(named: name)!)
    }
    
}
