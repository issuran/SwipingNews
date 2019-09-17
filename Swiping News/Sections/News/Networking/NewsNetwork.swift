//
//  NewsNetwork.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 31/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

class NewsNetwork: ServiceProvider<GoogleNewsAPI> {
    func getTopHeadlines(country: String, completion: @escaping (Result<Articles?>) -> Void) {
        let provider = ServiceProvider<GoogleNewsAPI>()
        
        do {
            try provider.execute(service: .topHeadlines(country: country)) { (result) in
                switch result {
                case .success(let data, let response):
                    let decoder = JSONDecoder()
                    let model = try! decoder.decode(Articles.self, from: data)
                    completion(.success(model, response))
                case .failure(let error):
                    completion(.failure(error))
                case .empty:
                    completion(.empty)
                }
            }
        } catch {
            completion(.empty)
        }
    }
}
