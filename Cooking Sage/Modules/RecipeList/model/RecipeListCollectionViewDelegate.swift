//
//  RecipeListCollectionViewDelegate.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

class RecipeListCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    var presenter: RecipeListPresenter?
    let cellSpacing: CGFloat = 12

    
    init(presenter: RecipeListPresenter? = nil) {
        self.presenter = presenter
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let recipe = presenter![indexPath.row]
    }

}
