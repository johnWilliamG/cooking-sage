//
//  RecipeViewController.swift
//  Cooking Sage
//
//  Created by John Galloway on 08/06/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

class RecipeViewController: UISplitViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello World")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        preferredPrimaryColumnWidthFraction = view.traitCollection.horizontalSizeClass == .regular
            ? 0.3
            : 0
    }
    
}
