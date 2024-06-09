//
//  PaginationView.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 7/6/24.
//

import UIKit

struct PaginationViewModel {
    let currentPage: Int
    let totalPages: Int
    let delegate: PaginationViewProtocol
}

protocol PaginationViewProtocol {
    func getPreviousPage()
    func getNextPage()
}

@IBDesignable
class PaginationView: BaseView {
    @IBOutlet private weak var currentPageLabel: UILabel!
    @IBOutlet private weak var previousPageButton: UIButton!
    @IBOutlet private weak var nextPageButton: UIButton!

    private var model: PaginationViewModel?
    
    func setup(_ model: PaginationViewModel) {
        self.model = model
        currentPageLabel.text = "\(model.currentPage) / \(model.totalPages)"
        previousPageButton.isEnabled = model.currentPage > 1
        nextPageButton.isEnabled = model.currentPage < model.totalPages
    }

    // MARK: Actions
    
    @IBAction private func previousPageTouchUp() {
        model?.delegate.getPreviousPage()
    }
    
    @IBAction private func nextPageTouchUp() {
        model?.delegate.getNextPage()
    }
}
