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
    
}


class RecipeDashboardPresenter: ListPresenter, PresenterDelegate {
    
    typealias item = RecipeDashBoardSection
    
    var delegate: PresenterDelegate?
    private(set) var items: [item] = []
    
    func loadData() {
        
        items = [
            generateSection(type: .favourites),
            generateSection(type: .trending),
        ]
        _ = items.compactMap({ $0.sectionPresenter.loadData() })
        delegate?.didUpdate()
    }
    
    func generateSection(type: RecipeDashBoardSectionType) -> RecipeDashBoardSection {
        let presenter = RecipeListPresenter()
        let section = RecipeDashBoardSection(
            type: type,
            sectionPresenter: presenter,
            collectionView: UICollectionView(frame: .zero, collectionViewLayout: RecipeListCollectionViewFlowLayout())
        )
        presenter.delegate = self
        return section
    }
    
    func didUpdate() {
        delegate?.didUpdate()
    }
    
}
