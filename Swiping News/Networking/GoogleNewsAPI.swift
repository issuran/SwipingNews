//
//  GoogleNewsAPI.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 31/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

enum GoogleNewsAPI {
    case topHeadlines(country: String)
}

extension GoogleNewsAPI: ServiceProtocol {
    var api_key: String {
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            let keys = NSDictionary(contentsOfFile: path)
            if let dict = keys {
                let api_key = dict["API_KEY"] as! String
                return api_key
            }
        }
        return ""
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
