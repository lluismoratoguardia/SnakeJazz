//
//  Nibable.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 11/6/24.
//

import UIKit

protocol Nibable: AnyObject {
    static var nibName: String { get }
    static func nib() -> UINib
}

extension Nibable {
    static var nibName: String {
        String(describing: self)
    }
    
    static func nib() -> UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: nibName, bundle: bundle)
    }
}
