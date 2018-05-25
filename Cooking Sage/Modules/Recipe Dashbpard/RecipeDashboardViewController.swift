//
//  RecipeDashboardViewController.swift
//  Cooking Sage
//
//  Created by John Galloway on 25/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

class ReciepDashboardViewController: UIViewController {
    
    let tableView: UITableView
    let presenter: RecipeDashboardPresenter
    let tableViewManager: RecipeDashboardTableViewManager
    
    init(presenter: RecipeDashboardPresenter) {
        self.tableView = UITableView(frame: .zero)
        self.presenter = presenter
        self.tableViewManager = RecipeDashboardTableViewManager(presenter: self.presenter, tableView: tableView)
        self.tableView.delegate = tableViewManager
        self.tableView.dataSource = tableViewManager
        super.init(nibName: nil, bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = view.bounds
        tableView.register(UINib(nibName: RecipeDashboardCell.nibName, bundle: .main), forCellReuseIdentifier: RecipeDashboardCell.resueIdentifier)
        view.addSubview(tableView)
        presenter.loadData()

    }
    
}

extension ReciepDashboardViewController: PresenterDelegate {
    
    func didUpdate() {
        DispatchQueue.main.async {
            self.tableViewManager.updateSectionManagers()
            for sectionManger in self.tableViewManager.sectionManagers {
                sectionManger.sectionPresenter.loadData()
            }
            self.tableView.reloadData()
        }
    }
    
}
