//
//  ServiceProvider.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 16/09/19.
//  Copyright © 2019 Optimize 7. All rights reserved.
//

import Foundation

class ServiceProvider<T: ServiceProtocol> {
    var urlSession = URLSession.shared
    
    init() { }
    
    func execute(service: T, completion: @escaping (Result<Data>) -> Void) throws {
        do {
            let request = try service.urlRequest()
            urlSession.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    completion(.success(data, response))
                } else {
                    completion(.empty)
                }
            }.resume()
        } catch {
            throw error
        }
    }
}
