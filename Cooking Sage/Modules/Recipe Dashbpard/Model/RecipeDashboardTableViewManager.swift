//
//  RecipeDashboardTableViewManager.swift
//  Cooking Sage
//
//  Created by John Galloway on 25/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

typealias TableViewManager = UITableViewDataSource & UITableViewDelegate & SectionManagerDelegate

class RecipeDashboardTableViewManager: NSObject, TableViewManager {
    
    let presenter: RecipeDashboardPresenter
    let numberOfCollectionsInSection = 1
    var sectionManagers: [RecipeDashBoardSection] = []
    let tableView: UITableView
    
    
    init(presenter: RecipeDashboardPresenter, tableView: UITableView) {
        self.presenter = presenter
        self.tableView = tableView
        super.init()
        self.sectionManagers = presenter.items.map({ _ -> RecipeDashBoardSection in
            let sectionManger = RecipeDashBoardSection(
                sectionPresenter: RecipeListPresenter(),
                collectionView: UICollectionView(
                    frame: .zero,
                    collectionViewLayout: RecipeListCollectionViewFlowLayout()
                )
            )
            sectionManger.delegate = self
            return sectionManger
        })
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCollectionsInSection;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipeDashboardCell.resueIdentifier,
                                                       for: indexPath) as? RecipeDashboardCell else {
                                                        return UITableViewCell()
        }
        let collectionView = sectionManagers[indexPath.section].collectionView
        collectionView.frame = cell.bounds
        cell.addSubview(collectionView)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.width / 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionManagers.count
    }
    
    func updateSectionManagers() {
        self.sectionManagers = presenter.items.map({ _ -> RecipeDashBoardSection in
            let sectionManger = RecipeDashBoardSection(
                sectionPresenter: RecipeListPresenter(),
                collectionView: UICollectionView(
                    frame: .zero,
                    collectionViewLayout: RecipeListCollectionViewFlowLayout()
                )
            )
            sectionManger.delegate = self
            return sectionManger
        })
    }
    
    func sectionDidUpdate() {
        self.tableView.reloadData()
    }
}
