//
//  RecipeListCollectionViewCell.swift
//  Cooking Sage
//
//  Created by John Galloway on 24/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit


class RecipeListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    static let nibName = "RecipeListCollectionViewCell"
    static let reuseIdentifier = "RecipeCell"
    var tranformation: CGAffineTransform?
    var isWobbling: Bool = false
    @objc var tappedDelete: (RecipeListCollectionViewCell) -> Void = { _  in }
    
    func decorateWith(recipe: Recipe) {
        imageView.image = recipe.image
        label.text = recipe.name
    }
    
    
    func wobble(left: Bool = true, stop: inout Bool) {
        
        isWobbling = true
        let wobbleMagnitude: CGFloat = 0.02
        let leftWobble = CGAffineTransform(rotationAngle: -wobbleMagnitude)
        let rightWobble = CGAffineTransform(rotationAngle: wobbleMagnitude)
        guard !stop else { return }
        UIView.animate(withDuration: 0.1, delay: 0.02, options: [.allowUserInteraction, .allowAnimatedContent], animations: { () -> Void in
            self.transform =  left ? leftWobble : rightWobble
        }, completion: { [weak self]  completed in
            if (completed) {
                self?.wobble(left: !left, stop: &stop)
            }
        })
    }
    
    func addDeleteCircle() {
        let radius: CGFloat = 14
        let point = CGPoint(x: -radius, y: -radius)
        let frame = CGRect(origin: point, size: CGSize(width: radius*2, height: radius*2))
        let deleteView = UIView(frame: frame)
        
        deleteView.backgroundColor = .red
        deleteView.layer.cornerRadius = radius
        clipsToBounds = false
        addSubview(deleteView)
        let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(deleteDidTouchUpInside))
        deleteView.addGestureRecognizer(gestureRecogniser)
    }
    
    @objc func deleteDidTouchUpInside() {
        tappedDelete(self)
    }
    
}
