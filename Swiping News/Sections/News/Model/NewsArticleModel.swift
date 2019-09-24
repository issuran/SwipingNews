//
//  NewsArticleModel.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 01/01/19.
//  Copyright © 2019 Optimize 7. All rights reserved.
//

import Foundation

struct Articles: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let author: String?
    let title: String?
    let content: String?
    let url: String?
    let urlToImage: String?
    let description: String?
    let publishedAt: String?
    
    let source: Source?
    
    init() {
        author = "Unknown"
        title = "Title"
        content = "Content not found!"
        url = ""
        urlToImage = ""
        description = ""
        source = Source(id: nil, name: "Unknown")
        publishedAt = Date().description
    }
}

struct Source: Codable {
    let id: String?
    let name: String?
}
