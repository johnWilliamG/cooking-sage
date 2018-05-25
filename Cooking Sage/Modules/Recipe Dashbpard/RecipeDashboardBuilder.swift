//
//  RecipeDashboardBuilder.swift
//  Cooking Sage
//
//  Created by John Galloway on 25/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit


class RecipeDashboardBuilder {
    
    func buildViewController() -> UIViewController {
        let presenter = RecipeDashboardPresenter()
        let vc = ReciepDashboardViewController(presenter: presenter)
        presenter.delegate = vc
        return vc
    }
    
}
