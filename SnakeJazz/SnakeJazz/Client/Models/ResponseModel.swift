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
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case pages = "pages"
        case next = "next"
        case previous = "prev"
    }
}
