//
//  UIViewExtension.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 7/6/24.
//

import UIKit

extension UIView {
    static func nibName() -> String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: nibName(), bundle: bundle)
    }
    
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
