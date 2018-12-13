//  WiredBrainCoffee
//
//  Created by Mark Moeykens on 12/11/18.
//  Copyright © 2018 Mark Moeykens. All rights reserved.
//

import UIKit

class SmallGiftCardCollectionViewSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var data = [GiftCardModel]()
    
    init(data: [GiftCardModel]) {
        self.data = data
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FeaturedGiftCardCell
        cell.setup(model: data[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (collectionView.bounds.height/2) * 3
        let height: CGFloat = collectionView.bounds.height
        
        return CGSize(width: width, height: height)
    }
}
