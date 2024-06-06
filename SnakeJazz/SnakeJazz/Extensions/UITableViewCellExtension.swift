//
//  UITableViewCellExtension.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 6/6/24.
//

import UIKit

extension UITableViewCell {
    class func getName() -> String {
        return String(describing: Self.self)
    }
}
