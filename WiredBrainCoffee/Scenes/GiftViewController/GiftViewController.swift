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
    
    var featuredGiftCards = [GiftCardModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        featuredCollectionView.dataSource = self
        
        GiftCardFunctions.getFeaturedGiftCards { [weak self] (featuredGiftCards) in
            guard let self = self else { return }
            
            self.featuredGiftCards = featuredGiftCards
            self.featuredCollectionView.reloadData()
        }
    }
}

extension GiftViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredGiftCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FeaturedGiftCardCell
        cell.setup(model: featuredGiftCards[indexPath.item])
        return cell
    }
}
