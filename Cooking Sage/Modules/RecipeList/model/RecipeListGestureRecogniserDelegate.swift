//
//  RecipeListGestureRecogniser.swift
//  Cooking Sage
//
//  Created by John Galloway on 29/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

class RecipeListGesturerecogniserDelegate<Presenter: ListPresenter>: NSObject, UIGestureRecognizerDelegate {
    
    let collectionView: UICollectionView
    var presenter: Presenter
    
    init(presenter: Presenter,
         collectionView: UICollectionView) {
        self.presenter = presenter
        self.collectionView = collectionView
        super.init()
    }
    
    @objc func handleLongPress(gesture : UILongPressGestureRecognizer!) {
        if gesture.state != .ended {
            return
        }
        let p = gesture.location(in: self.collectionView)
        guard p != CGPoint(x: 0, y: 0) else {
            return
        }
        for cell in collectionView.visibleCells {
                
            guard let cell = cell as? RecipeListCollectionViewCell,
                !cell.isWobbling else {
                    continue
            }
            cell.addDeleteCircle()
            cell.wobble()
            cell.isWobbling = true
            cell.tappedDelete = { [weak self] cell in
                guard let indexPath = self?.collectionView.indexPath(for: cell) else {
                    return
                }
                self?.presenter.items.remove(at: indexPath.row)
                self?.collectionView.performBatchUpdates({ [weak self] in
                    self?.collectionView.deleteItems(at: [indexPath])
                    }, completion: nil)
            }
        }
    }
}
