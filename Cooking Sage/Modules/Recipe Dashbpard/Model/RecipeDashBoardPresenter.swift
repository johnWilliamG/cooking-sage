//
//  RecipeDashBoardPresenter.swift
//  Cooking Sage
//
//  Created by John Galloway on 25/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import Foundation

protocol  ListPresenter {
    
    func loadData()
    
    associatedtype item
    
    var items: [item] { get }
    
}


class RecipeDashboardPresenter: ListPresenter {
    
    typealias item = RecipeDashBoardSectionType
    
    
    var delegate: PresenterDelegate?
    var items: [item] = []
    
    func loadData() {
        
        items = [
            RecipeDashBoardSectionType.favourites,
            RecipeDashBoardSectionType.trending,
        ]
        delegate?.didUpdate()
    }
    
}
