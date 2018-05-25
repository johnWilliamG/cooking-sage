//
//  RecipeListCollectionViewDelegate.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

class RecipeListCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    let presenter: RecipeListPresenter
    let cellSpacing: CGFloat = 12

    
    init(presenter: RecipeListPresenter) {
        self.presenter = presenter
    }



        
}
