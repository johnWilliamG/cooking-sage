//
//  RecipeDashboardTableViewDelegate.swift
//  Cooking Sage
//
//  Created by John Galloway on 27/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

class RecipeDashboardTableViewDelegate: NSObject, UITableViewDelegate {
    
    
    let presenter: RecipeDashboardPresenter
    let favouriteSectionHeight: CGFloat = 240
    let headerSectionHeight: CGFloat = 28

    init(presenter: RecipeDashboardPresenter) {
        self.presenter = presenter
        super.init()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView(reuseIdentifier: "HeaderView")
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else {
            return
        }
        headerView.textLabel?.text = presenter.items[section].type.rawValue
        headerView.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.items[indexPath.section].type == .favourites
            ?favouriteSectionHeight
            :tableView.bounds.size.height - favouriteSectionHeight
    }
    
}
