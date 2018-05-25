//
//  ReciepeListViewController.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import Foundation
import UIKit

class RecipeListViewController<T: ListPresenter>: UIViewController {
    
    let collectionView: UICollectionView
    private let dataSource: UICollectionViewDataSource
    private let presenter: T
    
    init(presenter: T) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: RecipeListCollectionViewFlowLayout())
        self.presenter = presenter
        self.dataSource = RecipeListCollectionViewDataSource(presenter: presenter)
        collectionView.dataSource = self.dataSource
        super.init(nibName: nil, bundle: nil)
    }

    // Not Yet Implemented
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: RecipeListCollectionViewCell.nibName, bundle: .main), forCellWithReuseIdentifier: RecipeListCollectionViewCell.reuseIdentifier)
    
        view.addSubview(collectionView)
        presenter.loadData()
    }
        
}

extension RecipeListViewController: PresenterDelegate {
    func didUpdate() {
        DispatchQueue.main.async { [unowned self] in
            self.collectionView.reloadData()
        }
    }
}
