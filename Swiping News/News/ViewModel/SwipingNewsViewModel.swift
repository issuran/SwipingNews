//
//  SwipingNewsViewModel.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 30/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import Foundation

class SwipingNewsViewModel {
    
    let service = NewsNetwork()
    var coordinator: AppCoordinator!
    var topHeadlines: Articles?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func callNewsDetail(model: SwipingNewsModel) {
        self.coordinator.callNewsDetail(model: model)
    }
    
    func getTopHeadlines() {
        service.getTopHeadlines(country: "br") { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let articles, _):
                self.topHeadlines = articles
                // SET OBSERVABLE WITH RESULT
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .empty:
                print("Empty result")
            }
        }
    }
}
