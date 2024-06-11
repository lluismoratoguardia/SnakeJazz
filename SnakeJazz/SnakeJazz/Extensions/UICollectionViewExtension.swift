//
//  UICollectionViewExtension.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 11/6/24.
//

import UIKit

extension UICollectionView {
    func register<T: Reusable & Nibable>(_ type: T.Type) {
        register(type.nib(), forCellWithReuseIdentifier: type.reuseIdentifier)
    }
    
    func registerHeader<T: Reusable & Nibable>(_ type: T.Type) {
        register(type.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.reuseIdentifier)
    }
    
    func dequeueCell<T: UICollectionViewCell>(_ indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unexpected UICollectionViewReusableCell Type for reuseIdentifier \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    func dequeueHeader<T: UICollectionReusableView>(_ indexPath: IndexPath) -> T {
        guard let supplementaryView = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unexpected UICollectionViewReusableView Type for reuseIdentifier \(T.reuseIdentifier)")
        }
        
        return supplementaryView
    }
}

extension UICollectionReusableView: Reusable, Nibable {}
