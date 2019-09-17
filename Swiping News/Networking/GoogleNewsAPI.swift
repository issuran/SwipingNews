//
//  GoogleNewsAPI.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 31/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

enum GoogleNewsAPI {
    case topHeadlines
}

extension GoogleNewsAPI: EndpointType {
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2")!
    }
    
    var path: String {
        switch self {
        case .topHeadlines:
            let base = self.baseURL.absoluteString
            let country = Countries.country(.Brasil)()
            
            return "\(base)/top-headlines?country=\(country)&apiKey=\(Keys.API_KEY)"
        }
    }
}
