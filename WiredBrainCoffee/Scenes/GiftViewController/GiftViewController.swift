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

        
    }
}

extension GiftViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredGiftCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
}
