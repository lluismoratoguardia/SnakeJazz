//
//  BaseViewController.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 7/6/24.
//

import UIKit

class BaseViewController: UIViewController {
    lazy var loadingSpinner: DelayableActivityIndicator = {
        return createSpinner()
    }()
    
    func showLoadingIndicator() {
        view.bringSubviewToFront(loadingSpinner)
        view.isUserInteractionEnabled = false
        loadingSpinner.startAnimating(delay: 0.5)
    }
    
    func dismissLoadingIndicator() {
        view.isUserInteractionEnabled = true
        loadingSpinner.stopAnimating()
    }
    
    private func createSpinner() -> DelayableActivityIndicator {
        let spinner = DelayableActivityIndicator(frame: CGRect(x: 0, y: 0, width: 40, height:40))
        spinner.backgroundColor = Colors.loadingSpinnerBackground
        spinner.layer.cornerRadius = 3.0
        spinner.clipsToBounds = true
        spinner.hidesWhenStopped = true
        spinner.style = .large;
        spinner.center = view.center
        spinner.isHidden = true
        view.addSubview(spinner)
        
        return spinner
    }
}
