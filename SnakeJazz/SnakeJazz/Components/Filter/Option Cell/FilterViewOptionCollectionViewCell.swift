//
//  FilterViewCollectionViewCell.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 10/6/24.
//

import UIKit

struct FilterViewOptionCollectionViewCellModel {
    let title: String
}

class FilterViewOptionCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var roundedView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var model: FilterViewOptionCollectionViewCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        // Initialization code
    }
    
    private func setupView() {
        titleLabel.font = Fonts.defaultText
        roundedView.layer.cornerRadius = frame.height / 2
        roundedView.layer.borderWidth = 2
        roundedView.layer.borderColor = Colors.brand.cgColor
    }

    func setup(_ model: FilterViewOptionCollectionViewCellModel) {
        self.model = model
        titleLabel.text = model.title
    }
}
