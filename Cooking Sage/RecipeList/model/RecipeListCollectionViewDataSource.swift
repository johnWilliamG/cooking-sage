//
//  RecipeListCollectionViewDataSource.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import Foundation
import UIKit

class RecipeListCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    
    let presenter: RecipeListPresenter
    
    init(presenter: RecipeListPresenter) {
        self.presenter = presenter
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case RecipeListPresenter.listSection.favourites.rawValue:
            return presenter.favouriteRecipes.count
        default:
            return presenter.recipeList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeListCollectionViewCell.reuseIdentifier, for: indexPath) as? RecipeListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let recipe: Recipe = {
            switch indexPath.section {
            case RecipeListPresenter.listSection.favourites.rawValue:
                return presenter.favouriteRecipes[indexPath.row]
            default:
                return presenter.recipeList[indexPath.row]
            }
        }()
        
        cell.decorateWith(recipe: recipe)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
}
