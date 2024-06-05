//
//  UIViewControllerExtension.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 5/6/24.
//

import UIKit

extension UIViewController {
    class func getName() -> String {
        return String(describing: Self.self)
    }
}
