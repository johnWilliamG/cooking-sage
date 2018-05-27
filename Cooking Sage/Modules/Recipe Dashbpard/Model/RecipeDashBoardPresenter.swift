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
    
    var items: [item] { get }
    
    var delegate: PresenterDelegate? { get set }
    
}


class RecipeDashboardPresenter: PresenterDelegate {
    
    typealias item = RecipeDashBoardSection
    
    var delegate: PresenterDelegate?
    
    var items: [RecipeDashBoardSection] = [] as! [RecipeDashBoardSection]
    
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
            sectionPresenter: RecipeListPresenter(),
            collectionView: UICollectionView(frame: .zero, collectionViewLayout: RecipeListCollectionViewFlowLayout()))
        
    }
    
    func didUpdate() {
        delegate?.didUpdate()
    }
    
}
