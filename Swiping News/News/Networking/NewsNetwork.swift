//
//  NewsNetwork.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 31/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit
import Foundation

class NewsNetwork {
    let url = URL(string: GoogleNewsAPI.topHeadlines().path)
    
    func performRequest() {
        guard let url = self.url else {
            fatalError()
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Error Response eieiei")
                return
            }
            do {
                let decoder = JSONDecoder()
                let array = try decoder.decode(Articles.self, from: data)
                print(array)
            } catch let parsingError {
                print("Error aiaiai", parsingError)
            }
        }
        task.resume()
    }
}
