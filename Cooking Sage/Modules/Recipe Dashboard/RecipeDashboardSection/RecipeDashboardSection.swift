//
//  RecipeDashboardSection.swift
//  Cooking Sage
//
//  Created by John Galloway on 25/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

enum RecipeDashBoardSectionType: String {
    case favourites = "Favourites ❤️"
    case trending = "Trending 🔥"
}

class RecipeDashBoardSection: NSObject, PresenterDelegate {
    
    let sectionPresenter: RecipeListPresenter
    var delegate: PresenterDelegate?
    let collectionView: UICollectionView
    let collectionViewDataSource: UICollectionViewDataSource
    let collectionViewDelegate: UICollectionViewDelegate
    let type: RecipeDashBoardSectionType
    let gestureDelegate: RecipeListGesturerecogniserDelegate<RecipeListPresenter>
    
    init(type: RecipeDashBoardSectionType,
         sectionPresenter: RecipeListPresenter,
         collectionView: UICollectionView) {
        self.type = type
        self.collectionView = collectionView
        self.sectionPresenter = sectionPresenter
        self.collectionViewDelegate = RecipeListCollectionViewDelegate()
        self.collectionViewDataSource = RecipeListCollectionViewDataSource(presenter: self.sectionPresenter)
        self.collectionView.dataSource = self.collectionViewDataSource
        self.collectionView.delegate = self.collectionViewDelegate
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: RecipeListCollectionViewCell.nibName, bundle: .main), forCellWithReuseIdentifier: RecipeListCollectionViewCell.reuseIdentifier)
        self.gestureDelegate = RecipeListGesturerecogniserDelegate(presenter: self.sectionPresenter,
                                                                   collectionView: self.collectionView)
        let longPressRecogniser = UILongPressGestureRecognizer(target: gestureDelegate, action: #selector(gestureDelegate.handleLongPress))
        collectionView.addGestureRecognizer(longPressRecogniser)
        super.init()
        self.sectionPresenter.delegate = self
    }
    
    func didUpdate() {
        DispatchQueue.main.async {
            self.delegate?.didUpdate()
            self.collectionView.reloadData()
        }
    }
}
