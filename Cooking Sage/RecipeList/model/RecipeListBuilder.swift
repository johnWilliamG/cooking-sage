//
//  RecipeListBuilder.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import Foundation


struct RecipeListBuilder {
    
    func buildViewController() -> RecipeListViewController {
        
        let presenter = RecipeListPresenter()
        let vc = RecipeListViewController(presenter: presenter)
        presenter.delegate = vc
        return vc
        
    }
    
    
}
