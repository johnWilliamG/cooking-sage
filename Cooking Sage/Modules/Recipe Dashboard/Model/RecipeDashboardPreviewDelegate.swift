//
//  RecipeDashboardPreviewDelegate.swift
//  Cooking Sage
//
//  Created by John Galloway on 27/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

class RecipeDashboardPreviewDelegate: NSObject, UIViewControllerPreviewingDelegate {
    
    let viewController: UIViewController
    let tableView: UITableView
    let presenter: RecipeDashboardPresenter
    
    init( viewController: UIViewController,
          tableView: UITableView,
          presenter: RecipeDashboardPresenter ) {
        self.tableView = tableView
        self.presenter = presenter
        self.viewController = viewController
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let tableIndexPath = tableView.indexPathForRow(at: location) else {
            return nil
        }
        let collectionView = presenter.items[tableIndexPath.section].collectionView
        let collectionViewPoint = collectionView.convert(location, from: tableView)
        guard let collectionIndexPath = collectionView.indexPathForItem(at: collectionViewPoint),
            let cellAttributes = collectionView.layoutAttributesForItem(at: collectionIndexPath) else {
            return nil
        }
        let storyboard = UIStoryboard(name: RecipePreviewViewController.Storyboard.name.rawValue,
                                      bundle: .main)
        guard let previewViewController = storyboard.instantiateInitialViewController() as? RecipePreviewViewController else {
            return nil
        }
        let recipe = presenter.items[tableIndexPath.section].sectionPresenter.items[collectionIndexPath.row]
        _ = previewViewController.view
        previewViewController.previewImageView?.image = recipe.image
        previewViewController.recipe = recipe
        previewViewController.preferredContentSize = CGSize(width: 0.0, height: 300)
        previewingContext.sourceRect = cellAttributes.frame
        
        return previewViewController
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
//        viewController.present(viewControllerToCommit, animated: true, completion: nil)
    }
    
}
