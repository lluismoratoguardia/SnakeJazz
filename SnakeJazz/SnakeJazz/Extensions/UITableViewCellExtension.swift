//
//  UITableViewCellExtension.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 6/6/24.
//

import UIKit

extension UITableViewCell {
    static func reuseIdentifier() -> String {
        return String(describing: self) + "Identifier"
    }
}
