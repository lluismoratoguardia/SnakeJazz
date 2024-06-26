//
//  DashboardInteractor.swift
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

protocol DashboardBusinessLogic {
}

protocol DashboardDataStore {
    //var name: String { get set }
}

class DashboardInteractor: DashboardBusinessLogic, DashboardDataStore {
    var presenter: DashboardPresentationLogic?
    //var name: String = ""
}
