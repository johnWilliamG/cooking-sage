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
    var recipe: Recipe?
    
    let favouriteActionTitle = "Favourite ❤️"
    
    enum Storyboard: String {
        
        case name = "RecipePreviewViewController"
        
    }
    
    override var previewActionItems:  [UIPreviewActionItem] {

        let favouriteAction = UIPreviewAction(title: favouriteActionTitle, style: .selected) { [weak self]  _, _ in
            self?.defaults.add(recipe: self?.recipe)
        }
        
        return [favouriteAction]
    }
    
}
