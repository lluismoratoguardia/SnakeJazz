//
//  Client.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 6/6/24.
//

import Foundation

enum ErrorType: String {
    case network = "network"
    case undefined = "undefined"
    case badUrl = "badUrl"
}

enum RequestResult<T: Codable> {
    case success(response: T)
    case error(response: ErrorType)
}

class Client {
    static let shared = Client()
    
    private init() {}
    
    func requestPaginatedCharacters(completion: @escaping(RequestResult<PaginatedResponseModel<CharacterModel>>) -> Void) {
        let urlRequest = URLRequest(url: URL(string: ClientConstants.baseURL + ClientConstants.Endpoints.paginatedCharacters)!)
        
        performRequest(urlRequest, completion: completion)
    }
    
    func requestCharactersPage(_ pageUrl: String, completion: @escaping(RequestResult<PaginatedResponseModel<CharacterModel>>) -> Void) {
        guard let url = URL(string: pageUrl) else {
            completion(.error(response: .badUrl))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        performRequest(urlRequest, completion: completion)
    }
    
    private func performRequest<T: Codable>(_ urlRequest: URLRequest, completion: @escaping(RequestResult<T>) -> Void) {
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error, (error as NSError).code == NSURLErrorNotConnectedToInternet {
                    completion(.error(response: .network))
                    return
                }
                
                guard let urlResponse = response as? HTTPURLResponse else {
                    completion(.error(response: .undefined))
                    return
                }
                
                switch urlResponse.statusCode {
                case 200:
                    if let data = data, let object = try? JSONDecoder().decode(T.self, from: data) {
                        completion(.success(response: object))
                    } else {
                        completion(.error(response: .undefined))
                    }
                default:
                    completion(.error(response: .undefined))
                }
            }.resume()
        }
}
