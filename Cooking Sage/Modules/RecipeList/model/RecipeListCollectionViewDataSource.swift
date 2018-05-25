//
//  RecipeListCollectionViewDataSource.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import Foundation
import UIKit

class RecipeListCollectionViewDataSource<T: ListPresenter>: NSObject, UICollectionViewDataSource {
    
    
    let presenter: T
    
    init(presenter: T) {
        self.presenter = presenter
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeListCollectionViewCell.reuseIdentifier, for: indexPath) as? RecipeListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.decorateWith(recipe: presenter.items[indexPath.row] as! Recipe)
        
        return cell
    }
    
}
