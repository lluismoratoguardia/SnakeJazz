//
//  UICollectionViewCellExtension.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 9/6/24.
//

import UIKit

extension UICollectionViewCell {
    static func reuseIdentifier() -> String {
        return String(describing: self) + "Identifier"
    }
}
