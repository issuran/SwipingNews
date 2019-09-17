//
//  NewsDetailViewModel.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 30/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import Foundation

protocol NewsDetailDelegate {
    func callNewsDetail(model: SwipingNewsModel)
}

class NewsDetailViewModel {
    
    var coordinator: AppCoordinator!
    var model: SwipingNewsModel!
    
    init(model: SwipingNewsModel, coordinator: AppCoordinator) {
        self.model = model
        self.coordinator = coordinator
    }
}
