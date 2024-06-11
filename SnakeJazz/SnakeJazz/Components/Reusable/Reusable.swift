//
//  ReusableView.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 11/6/24.
//

import UIKit

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        String(describing: self) + "Identifier"
    }
}
