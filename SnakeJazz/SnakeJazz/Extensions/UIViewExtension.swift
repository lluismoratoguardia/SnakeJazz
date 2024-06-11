//
//  UIViewExtension.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 7/6/24.
//

import UIKit

extension UIView {
    func showLoader() -> UIActivityIndicatorView {
        //Customize as per your need
        let spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height:40))
        spinner.backgroundColor = Colors.loadingSpinnerBackground
        spinner.layer.cornerRadius = 3.0
        spinner.clipsToBounds = true
        spinner.hidesWhenStopped = true
        spinner.style = .medium
        spinner.center = self.center
        addSubview(spinner)
        spinner.startAnimating()
        isUserInteractionEnabled = false
        
        return spinner
    }
}

extension UIView: Nibable {}
