//
//  BaseRequestModel.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 6/6/24.
//

import Foundation

struct PaginatedResponseModel<T: Codable>: Codable {
    let info: PaginationModel
    let results: [T]
}

struct PaginationModel: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let previous: String?
}
