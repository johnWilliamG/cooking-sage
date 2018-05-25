//
//  ReciepeListViewController.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import Foundation
import UIKit

class RecipeListViewController: UIViewController {
    
    let collectionView: UICollectionView
    let dataSource: UICollectionViewDataSource
    let delegate: UICollectionViewDelegate
    let presenter: RecipeListPresenter
    
    init(presenter: RecipeListPresenter) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: RecipeListCollectionViewFlowLayout())
        self.presenter = presenter
        self.dataSource = RecipeListCollectionViewDataSource(presenter: presenter)
        self.delegate = RecipeListCollectionViewDelegate(presenter: presenter)
        super.init(nibName: nil, bundle: nil)
    }

    // Not Yet Implemented
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Recipe List"
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: RecipeListCollectionViewCell.nibName, bundle: .main), forCellWithReuseIdentifier: RecipeListCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
    
        view.addSubview(collectionView)
        presenter.loadData()
    }
        
}

extension RecipeListViewController: PresenterDelegate {
    func didUpdate(presenter: RecipeListPresenter) {
        DispatchQueue.main.async { [unowned self] in
            self.collectionView.reloadData()
        }
    }
}
