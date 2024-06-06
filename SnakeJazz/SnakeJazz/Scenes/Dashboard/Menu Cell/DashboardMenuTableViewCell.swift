//
//  DashboardMenuTableViewCell.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 6/6/24.
//

import UIKit

struct DashboardMenuCellModel {
    let title: String
}

class DashboardMenuTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var model: DashboardMenuCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(_ model: DashboardMenuCellModel) {
        self.model = model
        titleLabel.text = model.title
    }
}
