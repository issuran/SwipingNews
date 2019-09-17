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
    var requestStatus = Observable(RequestStatus.empty)
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func callNewsDetail(model: SwipingNewsModel) {
        self.coordinator.callNewsDetail(model: model)
    }
    
    func getTopHeadlines() {
        requestStatus.value = .loading
        service.getTopHeadlines(country: Countries.Brasil.country()) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let articles, _):
                self.topHeadlines = articles
                self.requestStatus.value = .load
            case .failure:
                // TODO: HANDLE ERROR
                self.requestStatus.value = .error
            case .empty:
                self.requestStatus.value = .empty
            }
        }
    }
}
