//
//  RecipeListCollectionViewCell.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

class RecipeListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    static let nibName = "RecipeListCollectionViewCell"
    static let reuseIdentifier = "RecipeCell"
    
    func decorateWith(recipe: Recipe) {
        imageView.image = recipe.image
        label.text = recipe.name
    }
}
