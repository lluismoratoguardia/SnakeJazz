//
//  EpisodesViewController.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 6/6/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol EpisodesDisplayLogic: AnyObject {
}

class EpisodesViewController: BaseViewController {
    var interactor: EpisodesBusinessLogic?
    var router: (NSObjectProtocol & EpisodesRoutingLogic & EpisodesDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = EpisodesInteractor()
        let presenter = EpisodesPresenter()
        let router = EpisodesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: View Setup
    
    private func setupView() {
        title = String(localized: "episodes_title")
        view.backgroundColor = Colors.backgroundColor
    }
    
    // MARK: Actions
}

extension EpisodesViewController: EpisodesDisplayLogic {
}
