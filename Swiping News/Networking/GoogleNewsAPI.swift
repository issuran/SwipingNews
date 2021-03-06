//
//  GoogleNewsAPI.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 31/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit
import Keys

enum GoogleNewsAPI {
    case topHeadlines(country: String)
}

extension GoogleNewsAPI: ServiceProtocol {
    var api_key: String {
        let keys = SwipingNewsKeys()
        return keys.aPI_KEY
    }
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "newsapi.org"
    }
    
    var method: HttpMethod {
        switch self {
        case .topHeadlines:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .topHeadlines:
            return "/top-headlines"
        }
    }
    
    var task: HttpTask {
        switch self {
        case .topHeadlines(let country):
            let parameters = ["country": country,
                              "apiKey": api_key]
            return .requestUrlParameters(urlParameters: parameters)
        }
    }
}
