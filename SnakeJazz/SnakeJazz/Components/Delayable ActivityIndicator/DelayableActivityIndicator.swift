//
//  DelayableActivityIndicator.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 7/6/24.
//

import UIKit

class DelayableActivityIndicator: UIActivityIndicatorView {
    private var inProgress = false
    
    func startAnimating(delay: TimeInterval) {
        inProgress = true
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let self = self else { return }
            if self.inProgress {
                self.startAnimating()
            }
        }
    }
    
    override func stopAnimating() {
        inProgress = false
        super.stopAnimating()
    }
}
