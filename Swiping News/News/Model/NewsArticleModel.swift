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
}
