//
//  GoogleNewsAPI.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 31/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

enum GoogleNewsAPI {
    case topHeadlines(source: String)
}

extension GoogleNewsAPI: EndpointType {
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2")!
    }
    
    var path: String {
        switch self {
        case .topHeadlines(let source):
            return "/top-headlines?sources=\(source)&country=br&apiKey=\(Keys.API_KEY)"
        }
    }
}
