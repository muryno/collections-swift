//
//  UICollectionViewCellExtension.swift
//  WiredBrainCoffee
//
//  Created by Mark Moeykens on 12/16/18.
//  Copyright © 2018 Mark Moeykens. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    class var identifier: String {
        return String(describing: self)
    }
}
