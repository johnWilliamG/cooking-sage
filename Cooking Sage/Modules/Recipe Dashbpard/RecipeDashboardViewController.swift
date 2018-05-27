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
    let dataSource: UITableViewDataSource
    let tableDelegate: UITableViewDelegate
    let presenter: RecipeDashboardPresenter
    var viewDelegate: UIViewControllerPreviewingDelegate?
    
    init(presenter: RecipeDashboardPresenter) {
        self.tableView = UITableView(frame: .zero)
        self.presenter = presenter
        self.dataSource = RecipeDashboardTableViewDataSource(presenter: self.presenter)
        self.tableDelegate = RecipeDashboardTableViewDelegate(presenter: self.presenter)
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.tableDelegate
        super.init(nibName: nil, bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Recipe Dashboard"
        tableView.register(UINib(nibName: RecipeDashboardCell.nibName, bundle: .main), forCellReuseIdentifier: RecipeDashboardCell.resueIdentifier)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        view.addSubview(tableView)
        presenter.loadData()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view .trailingAnchor).isActive = true
        self.viewDelegate = RecipeDashboardPreviewDelegate(viewController: self, tableView: tableView, presenter: presenter)

        registerForPreviewing(with: self.viewDelegate!, sourceView: view)
    }

    
}

extension ReciepDashboardViewController: PresenterDelegate {
    
    func didUpdate() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
