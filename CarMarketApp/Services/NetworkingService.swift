//
//  NetworkingService.swift
//  CarMarketApp
//
//  Created by Bartosz Wojtkowiak on 17/07/2022.
//

import Foundation

enum DataError: Error {
    case clientError
    case invalidResponse
    case invalidData
    case decodingError
    case serverError
}

protocol NetworkService {
    func downloadData<T: Decodable>(of type: T.Type, from url: URL, completion: @escaping (Result<T, DataError>) -> Void)
}

class Webservice: NetworkService {
    
    private init() { }
    static var shared = Webservice()
    
    func downloadData<T: Decodable>(of type: T.Type, from url: URL, completion: @escaping (Result<T, DataError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.clientError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(DataError.invalidResponse))
                return
            }
            
            if 200 ... 299 ~= response.statusCode {
                if let data = data {
                    do {
                        let decodedData: T = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    }
                    catch {
                        completion(.failure(DataError.decodingError))
                    }
                } else {
                    completion(.failure(DataError.invalidData))
                }
            } else {
                completion(.failure(DataError.serverError))
            }
        }.resume()
    }
}
