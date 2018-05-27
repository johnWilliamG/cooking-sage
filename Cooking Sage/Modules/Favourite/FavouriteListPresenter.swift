//
//  FavouriteListPresenter.swift
//  Cooking Sage
//
//  Created by John Galloway on 27/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

class FavouriteListPresenter: ListPresenter {
    
    
    func loadData() {
        items = UserDefaults.standard.recipes.compactMap({
            return Recipe(name: $0, image: UIImage(named: $0)!)
        })
        delegate?.didUpdate()
    }
    
    var delegate: PresenterDelegate?
    
    var items: [Recipe] = []
    
    typealias item = Recipe
    
}


