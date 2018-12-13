//
//  GiftViewController.swift
//  WiredBrainCoffee
//
//  Created by Mark Moeykens on 12/10/18.
//  Copyright © 2018 Mark Moeykens. All rights reserved.
//

import UIKit

class GiftViewController: UIViewController {

    @IBOutlet weak var seasonalCollectionView: UICollectionView!
    @IBOutlet weak var thankyouCollectionView: UICollectionView!
    @IBOutlet weak var birthdayCollectionView: UICollectionView!
    @IBOutlet weak var seasonalHeightConstraint: NSLayoutConstraint!
    @IBOutlet var smallerHeightConstraints: [NSLayoutConstraint]!
    
    var featuredGiftCards = [GiftCardModel]()
    var thankYouGiftCards = [GiftCardModel]()
    var birthdayGiftCards = [GiftCardModel]()

    var thankYouSource: SmallGiftCardCollectionViewSource?
    var birthdaySource: SmallGiftCardCollectionViewSource?

    override func viewDidLoad() {
        super.viewDidLoad()

        seasonalCollectionView.dataSource = self
        seasonalCollectionView.delegate = self
        
        setHeightOfCollectionViews()
        
        GiftCardFunctions.getFeaturedGiftCards { [weak self] (featuredGiftCards) in
            guard let self = self else { return }
            
            self.featuredGiftCards = featuredGiftCards
            self.seasonalCollectionView.reloadData()
            
            self.thankYouGiftCards = featuredGiftCards // TODO: Get different data.
            
            self.thankYouSource = SmallGiftCardCollectionViewSource(data: self.thankYouGiftCards)
            self.thankyouCollectionView.dataSource = self.thankYouSource
            self.thankyouCollectionView.delegate = self.thankYouSource
            self.thankyouCollectionView.reloadData()
            
            self.birthdayGiftCards = featuredGiftCards // TODO: Get different data.
            self.birthdaySource = SmallGiftCardCollectionViewSource(data: self.birthdayGiftCards)
            self.birthdayCollectionView.dataSource = self.birthdaySource
            self.birthdayCollectionView.delegate = self.birthdaySource
            self.birthdayCollectionView.reloadData()
        }
    }
    
    func setHeightOfCollectionViews() {
        let width = view.bounds.width - 70
        let height = width/3 * 2
        seasonalHeightConstraint.constant = height
        
        let smallerHeight = (height/2)
        smallerHeightConstraints.forEach { (constraint) in
            constraint.constant = smallerHeight
        }
    }
}

extension GiftViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredGiftCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FeaturedGiftCardCell
        cell.setup(model: featuredGiftCards[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // Should be 240 w, 160 h
        let width: CGFloat = (collectionView.bounds.height/2) * 3
        let height: CGFloat = collectionView.bounds.height

        return CGSize(width: width, height: height)
    }
}
