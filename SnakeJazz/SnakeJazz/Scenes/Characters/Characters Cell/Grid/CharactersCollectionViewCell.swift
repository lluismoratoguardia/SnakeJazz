//
//  CharactersCollectionViewCell.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 9/6/24.
//

import UIKit
import Kingfisher

struct CharactersCollectionViewCellModel {
    let portraitUrl: String
    let name: String
}

class CharactersCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var portraitImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    private var model: CharactersCollectionViewCellModel? {
        didSet {
            if let model = model {
                updateContent(model)
            } else {
                resetContent()
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setup(_ model: CharactersCollectionViewCellModel) {
        self.model = model
        nameLabel.text = model.name
    }
    
    private func updateContent(_ model: CharactersCollectionViewCellModel) {
        let imageUrl = URL(string: model.portraitUrl)
        portraitImageView.kf.setImage(with: imageUrl)
        nameLabel.text = model.name
    }
    
    private func resetContent() {
        portraitImageView.image = nil
        nameLabel.text = nil
    }
}
