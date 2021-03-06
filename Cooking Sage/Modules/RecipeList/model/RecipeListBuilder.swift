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
        
        let presenter = RecipeListPresenter(dataTask: dataTask)
        let vc = RecipeListViewController(presenter: presenter)
        presenter.delegate = vc
        return vc
        
    }
    
    func buildCollectionView() -> UICollectionView {
        
        let presenter = RecipeListPresenter(dataTask: dataTask)
        let dataSource = RecipeListCollectionViewDataSource(presenter: presenter)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: RecipeListCollectionViewFlowLayout())
        collectionView.dataSource = dataSource
        return collectionView
    
    }
    
    var dataTask: () -> [Recipe] = {
        
        func generateFrom(name: String) -> Recipe {
            return Recipe(name: name, image: UIImage(named: name)!)
        }
        
        return [
            generateFrom(name: "Chicken Pot"),
            generateFrom(name: "Lamb Shanks"),
            generateFrom(name: "Pasta"),
            generateFrom(name: "Chicken Pot"),
            generateFrom(name: "Lamb Shanks"),
            generateFrom(name: "Pasta"),
            generateFrom(name: "Baked"),
            generateFrom(name: "Gambas"),
            generateFrom(name: "Chicken Pot"),
            generateFrom(name: "Lamb Shanks"),
            generateFrom(name: "Pasta"),
            generateFrom(name: "Chicken Pot"),
            generateFrom(name: "Lamb Shanks"),
            generateFrom(name: "Pasta"),
            generateFrom(name: "Baked"),
            generateFrom(name: "Gambas"),
            generateFrom(name: "Chicken Pot"),
            generateFrom(name: "Lamb Shanks"),
            generateFrom(name: "Pasta"),
            generateFrom(name: "Chicken Pot"),
            generateFrom(name: "Lamb Shanks"),
            generateFrom(name: "Pasta"),
            generateFrom(name: "Baked"),
            generateFrom(name: "Gambas"),
            generateFrom(name: "Chicken Pot"),
            generateFrom(name: "Lamb Shanks"),
            generateFrom(name: "Pasta"),
            generateFrom(name: "Chicken Pot"),
            generateFrom(name: "Lamb Shanks"),
            generateFrom(name: "Pasta"),
            generateFrom(name: "Baked"),
            generateFrom(name: "Gambas"),
            ]
    }
    
}
