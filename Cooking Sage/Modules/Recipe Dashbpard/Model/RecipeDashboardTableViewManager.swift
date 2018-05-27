//
//  RecipeDashboardTableViewManager.swift
//  Cooking Sage
//
//  Created by John Galloway on 25/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

class RecipeDashboardTableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let presenter: RecipeDashboardPresenter
    let numberOfCollectionsInSection = 1
    let tableView: UITableView
    let favouriteSectionHeight: CGFloat = 240
    
    
    init(presenter: RecipeDashboardPresenter, tableView: UITableView) {
        self.presenter = presenter
        self.tableView = tableView
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
        let flowlayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowlayout.scrollDirection = presenter.items[indexPath.section].type == .favourites
            ?.horizontal
            :.vertical
        collectionView.frame = cell.bounds
        cell.addSubview(collectionView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.items[indexPath.section].type == .favourites
            ?favouriteSectionHeight
            :tableView.bounds.size.height - favouriteSectionHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.items.count
    }
}
