//
//  RecipeListCollectionViewFlowLayout.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

class RecipeListCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        
        itemSize = CGSize(width: 160, height: 160)
        sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
