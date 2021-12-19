//
//  RecipeDashboardTableViewManager.swift
//  Cooking Sage
//
//  Created by John Galloway on 25/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

class RecipeDashboardTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let presenter: RecipeDashboardPresenter
    let numberOfCollectionsInSection = 1
    
    init(presenter: RecipeDashboardPresenter) {
        self.presenter = presenter
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCollectionsInSection;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipeDashboardCell.resueIdentifier,
                                                       for: indexPath) as? RecipeDashboardCell else {
            return UITableViewCell()
        }
        
        let collectionView = presenter.items[indexPath.section].collectionView
        guard let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return UITableViewCell()
        }
        flowlayout.scrollDirection = presenter.items[indexPath.section].type == .favourites
            ?.horizontal
            :.vertical
        cell.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.items.count
    }
}
