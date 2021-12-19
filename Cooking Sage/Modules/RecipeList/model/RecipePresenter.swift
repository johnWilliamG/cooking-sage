//
//  ReciepeListPresenter.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

protocol PresenterDelegate {
   func didUpdate()
}

class RecipeListPresenter: ListPresenter {
    
    enum listSection: Int {
        case favourites = 0
        case recipeList = 1 
    }
    
    static let loadDataNotificationName: NSNotification.Name = NSNotification.Name(rawValue: "loadData")
    
    var delegate: PresenterDelegate?
    var items: [Recipe] = []
    let dataTask: () -> [Recipe]
    let notificationCenter: NotificationCenter
    
    init(dataTask: @escaping () -> [Recipe],
         notificationCenter: NotificationCenter = .default) {
        self.dataTask = dataTask
        self.notificationCenter = notificationCenter
        self.notificationCenter.addObserver(self, selector: #selector(loadData), name: RecipeListPresenter.loadDataNotificationName, object: nil)
    }

    @objc func loadData() {
        items = dataTask()
        delegate?.didUpdate()
    }
    
    func generateFrom(name: String) -> Recipe {
        return Recipe(name: name, image: UIImage(named: name)!)
    }
    
    
    
}
