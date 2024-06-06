//
//  Fonts.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 6/6/24.
//

import UIKit

struct Fonts {
    static let standoutTitle = UIFont(name: FontNames.getSchwifty, size: 40) ?? UIFont.systemFont(ofSize: 40)
    static let mainTitle = UIFont.systemFont(ofSize: 20, weight: .bold)
    static let mainSubtitle = UIFont.systemFont(ofSize: 16, weight: .bold)
    static let disclaimer = UIFont.italicSystemFont(ofSize: 8)
    static let defaultText = UIFont.systemFont(ofSize: 16)
}

struct FontNames {
    static let getSchwifty = "GetSchwifty-Regular"
}
