//
//  UITableViewCellExtension.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 6/6/24.
//

import UIKit

extension UITableViewCell {
    static func nibName() -> String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: nibName(), bundle: bundle)
    }
    
    static func reuseIdentifier() -> String {
        return String(describing: self) + "Identifier"
    }
}
