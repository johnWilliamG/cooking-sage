//
//  RecipeDashboardSection.swift
//  Cooking Sage
//
//  Created by John Galloway on 25/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

enum RecipeDashBoardSectionType {
    case favourites
    case trending
}

protocol SectionManagerDelegate {
    func sectionDidUpdate()
}

class RecipeDashBoardSection: NSObject, PresenterDelegate {
    
    let sectionPresenter: RecipeListPresenter
    var delegate: SectionManagerDelegate?
    let collectionView: UICollectionView
    let collectionViewDataSource: UICollectionViewDataSource
    let collectionViewDelegate: UICollectionViewDelegate
    
    init(sectionPresenter: RecipeListPresenter,
         collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.sectionPresenter = sectionPresenter
        self.collectionViewDelegate = RecipeListCollectionViewDelegate(presenter: self.sectionPresenter)
        self.collectionViewDataSource = RecipeListCollectionViewDataSource(presenter: self.sectionPresenter)
        self.collectionView.dataSource = self.collectionViewDataSource
        self.collectionView.delegate = self.collectionViewDelegate
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: RecipeListCollectionViewCell.nibName, bundle: .main), forCellWithReuseIdentifier: RecipeListCollectionViewCell.reuseIdentifier)
        super.init()
        self.sectionPresenter.delegate = self
    }
    
    func didUpdate() {
        DispatchQueue.main.async {
            self.delegate?.sectionDidUpdate()
            self.collectionView.reloadData()
        }
    }
}
