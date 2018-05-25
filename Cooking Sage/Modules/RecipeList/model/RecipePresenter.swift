//
//  ReciepeListPresenter.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

protocol PresenterDelegate {
   func didUpdate()
}

class RecipeListPresenter: ListPresenter {
    
    enum listSection: Int {
        case favourites = 0
        case recipeList = 1 
    }
    
    var delegate: PresenterDelegate?
    var items: [Recipe] = []
    typealias item = Recipe

    func loadData() {
        
        items = [
            generateFrom(name: "Chicken Pot"),
            generateFrom(name: "Lamb Shanks"),
            generateFrom(name: "Pasta"),
            generateFrom(name: "Chicken Pot"),
            generateFrom(name: "Lamb Shanks"),
            generateFrom(name: "Pasta"),
            generateFrom(name: "Baked"),
            generateFrom(name: "Gambas"),
        ]
        
        delegate?.didUpdate()
    }
    
    func generateFrom(name: String) -> Recipe {
        return Recipe(name: name, image: UIImage(named: name)!)
    }
    
}
