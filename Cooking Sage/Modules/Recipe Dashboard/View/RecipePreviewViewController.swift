//
//  RecipePreviewViewController.swift
//  Cooking Sage
//
//  Created by John Galloway on 27/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

class RecipePreviewViewController: UIViewController {
    
    @IBOutlet var previewImageView: UIImageView?
    
    private let defaults: UserDefaults = .standard
    private let notificationCenter: NotificationCenter = .default
    var recipe: Recipe?
    
    let favouriteActionTitle = "Favourite ❤️"
    let dismisstitle = "Dismiss"
    
    enum Storyboard: String {
        
        case name = "RecipePreviewViewController"
        
    }
    
    override var previewActionItems:  [UIPreviewActionItem] {

        let favouriteAction = UIPreviewAction(title: favouriteActionTitle, style: .default) { [weak self]  _, _ in
            self?.defaults.add(recipe: self?.recipe)
            self?.notificationCenter.post(name: RecipeListPresenter.loadDataNotificationName, object: nil)
        }
        
        let dismissAction = UIPreviewAction(title: dismisstitle, style: .destructive) { _, _ in }
        
        return [favouriteAction,  dismissAction]
    }
    
}
