//
//  FilterViewSectionHeaderCollectionReusableView.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 11/6/24.
//

import UIKit

struct FilterViewSectionHeaderCollectionReusableViewModel {
    let title: String
}

class FilterViewSectionHeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var sectionHeaderlabel: UILabel!
    
    private var model: FilterViewSectionHeaderCollectionReusableViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionHeaderlabel.font = Fonts.mainTitle
    }
    
    func setup(_ model: FilterViewSectionHeaderCollectionReusableViewModel) {
        self.model = model
        sectionHeaderlabel.text = model.title
    }
}
