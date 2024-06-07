//
//  CharactersModels.swift
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

struct CharactersViewModel {
    struct Character {
        let id: Int
        let name: String
        let status: CharactersViewModel.CharacterStatus
        let type: String
        let gender: CharactersViewModel.CharacterGender
        let origin: String
        let lastLocation: String
        let image: String
    }
    
    enum CharacterStatus {
        case dead
        case alive
        case unknown
    }
    
    enum CharacterGender {
        case male
        case female
        case genderless
        case unknown
    }
    
    struct PaginationInformation {
        let charactersTotal: Int
        let numberOfPages: Int
        let currentPage: Int
        let charactersPerPage: Int
    }
}
