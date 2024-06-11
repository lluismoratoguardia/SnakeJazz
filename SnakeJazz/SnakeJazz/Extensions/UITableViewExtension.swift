//
//  UITableViewExtension.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 11/6/24.
//

import UIKit

extension UITableView {
    func register<T: Reusable & Nibable>(_ type: T.Type) {
        register(type.nib(), forCellReuseIdentifier: type.reuseIdentifier)
    }
    
    func registerFooterHeader<T: Reusable & Nibable>(_ type: T.Type) {
        register(type.nib(), forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }
    
    func dequeueCell<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unexpected UITableViewReusableCell Type for reuseIdentifier \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    func dequeueView<T: UITableViewHeaderFooterView>() -> T {
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Unexpected UITableViewReusableView Type for reuseIdentifier \(T.reuseIdentifier)")
        }
        
        return cell
    }
}

extension UITableViewCell: Reusable, Nibable {}
extension UITableViewHeaderFooterView: Reusable, Nibable {}
