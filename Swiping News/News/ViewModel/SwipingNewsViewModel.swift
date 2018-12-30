//
//  SwipingNewsViewModel.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 30/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import Foundation

class SwipingNewsViewModel {
    
    var coordinator: AppCoordinator!
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func callNewsDetail(model: SwipingNewsModel) {
        self.coordinator.callNewsDetail(model: model)
    }
}
