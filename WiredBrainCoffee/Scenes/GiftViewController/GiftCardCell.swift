//
//  FeaturedGiftCardCell.swift
//  WiredBrainCoffee
//
//  Created by Mark Moeykens on 12/10/18.
//  Copyright © 2018 Mark Moeykens. All rights reserved.
//

import UIKit

class GiftCardCell: UICollectionViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardImageView.layer.cornerRadius = 10
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = CGSize(width: 0, height: 3)
        cardView.layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    func setup(model: GiftCardModel) {
        cardImageView.image = model.image
    }
}
