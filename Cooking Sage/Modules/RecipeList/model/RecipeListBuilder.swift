//
//  RecipeListBuilder.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit


struct RecipeListBuilder {
    
    func buildViewController() -> RecipeListViewController<RecipeListPresenter> {
        
        let presenter = RecipeListPresenter()
        let vc = RecipeListViewController(presenter: presenter)
        presenter.delegate = vc
        return vc
        
    }
    
    func buildCollectionView() -> UICollectionView {
        
        let presenter = RecipeListPresenter()
        let dataSource = RecipeListCollectionViewDataSource(presenter: presenter)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: RecipeListCollectionViewFlowLayout())
        collectionView.dataSource = dataSource
        return collectionView
    
    }
    
    
}
