//
//  RecipeDashBoardPresenter.swift
//  Cooking Sage
//
//  Created by John Galloway on 25/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

protocol  ListPresenter {
    
    func loadData()
    
    associatedtype item
    
    var items: [item] { get set }
    
    var delegate: PresenterDelegate? { get set }
    
}


class RecipeDashboardPresenter: PresenterDelegate {
        
    var delegate: PresenterDelegate?
    
    var items: [RecipeDashBoardSection] = []
    
    func loadData() {
        
        items = [
            generateSectionFromType(type: .favourites),
            generateSectionFromType(type: .trending)
        ]
        _ = items.compactMap({ $0.sectionPresenter.loadData() })
        delegate?.didUpdate()
    }
    
    func generateSectionFromType(type: RecipeDashBoardSectionType) -> RecipeDashBoardSection {
        
        return  RecipeDashBoardSection(
            type: type,
            sectionPresenter: RecipeListPresenter(dataTask: type == .favourites ? dataTask : dataTask),
            collectionView: UICollectionView(frame: .zero, collectionViewLayout: RecipeListCollectionViewFlowLayout()))
        
    }
    
    func didUpdate() {
        delegate?.didUpdate()
    }
    
    var userDefaultsTask: () -> [Recipe] = {
        return UserDefaults.standard.recipes.compactMap({
            return Recipe(name: $0, image: UIImage(named: $0)!)
        })
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
