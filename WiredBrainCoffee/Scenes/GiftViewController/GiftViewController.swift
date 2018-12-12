//
//  GiftViewController.swift
//  WiredBrainCoffee
//
//  Created by Mark Moeykens on 12/10/18.
//  Copyright © 2018 Mark Moeykens. All rights reserved.
//

import UIKit

class GiftViewController: UIViewController {

    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    var featuredGiftCards = [GiftCardModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        featuredCollectionView.dataSource = self
        featuredCollectionView.delegate = self
        
        setHeightOfFeaturedCollectionView()
        
        GiftCardFunctions.getFeaturedGiftCards { [weak self] (featuredGiftCards) in
            guard let self = self else { return }
            
            self.featuredGiftCards = featuredGiftCards
            self.featuredCollectionView.reloadData()
        }
    }
    
    func setHeightOfFeaturedCollectionView() {
        let width = view.bounds.width - 70
        let height = width/3 * 2
        collectionViewHeightConstraint.constant = height
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
        
        let width: CGFloat = (collectionView.bounds.height/2) * 3
        let height: CGFloat = collectionView.bounds.height
        
        return CGSize(width: width, height: height)
    }
}
