//
//  CharactersTableViewCell.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 7/6/24.
//

import UIKit

struct CharactersTableViewCellModel {
    let name: String
}

class CharactersTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    
    private var model: CharactersTableViewCellModel?
    
    func setup(_ model: CharactersTableViewCellModel) {
        self.model = model
        nameLabel.text = model.name
    }
}
